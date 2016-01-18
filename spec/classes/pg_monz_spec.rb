require 'spec_helper'

describe 'pg_monz' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "pg_monz class without any parameters" do
          it { should compile.with_all_deps }
          it { should contain_class('pg_monz') }
          it { should contain_class('pg_monz::params') }
          it { should contain_class('pg_monz::install') 
            .that_comes_before('pg_monz::config')}
          it { should contain_class('pg_monz::config') 
            .that_comes_before('pg_monz::service')}
          it { should contain_class('pg_monz::service') }

          it do 
            should contain_file('/opt/pg_monz')
              .with('ensure' => 'directory',
                    'owner' => 'zabbix',
                    'group' => 'zabbix')
          end

          it do
            should contain_staging__file('pg_monz-2.0.tar.gz')
              .with('source' => 'https://github.com/pg-monz/pg_monz/archive/2.0.tar.gz')
          end

          it do
            should contain_staging__extract('pg_monz-2.0.tar.gz')
              .with('target' => '/opt/pg_monz',
                    'creates' => '/opt/pg_monz/pg_monz-2.0/LICENSE')
              .that_requires('Staging::File[pg_monz-2.0.tar.gz]')
          end

          it do 
            should contain_file('/usr/local/bin/pg_monz')
              .with('ensure' => 'link',
                    'owner' => 'zabbix',
                    'group' => 'zabbix',
                    'target' => '/opt/pg_monz/pg_monz-2.0/pg_monz/usr-local-bin')
          end

          it do 
            should contain_file('/etc/pg_monz')
              .with('ensure' => 'directory',
                    'owner' => 'zabbix',
                    'group' => 'zabbix',
                    'mode' => '0750')
          end

          it do 
            should contain_file('/etc/pg_monz/pgsql_funcs.conf')
              .with('ensure' => 'present',
                    'owner' => 'zabbix',
                    'group' => 'zabbix')
              .that_requires('File[/etc/pg_monz]')
          end

          it do 
            should contain_file('/etc/pg_monz/pgpool_funcs.conf')
              .with('ensure' => 'present',
                    'owner' => 'zabbix',
                    'group' => 'zabbix')
              .that_requires('File[/etc/pg_monz]')
          end


          it do
            should contain_file('/etc/zabbix/zabbix_agentd.d/userparameter_pg_monz.conf')
              .with('ensure' => 'present',
                    'owner' => 'zabbix',
                    'group' => 'zabbix',
                    'mode' => '0640')
              .that_requires('Staging::Extract[pg_monz-2.0.tar.gz]')
              .that_notifies('Exec[zabbix-agent-reload]')
          end

          it do
            should contain_exec('zabbix-agent-reload')
              .with('command' => '/etc/init.d/zabbix-agent restart',
                    'user' => 'root',
                    'refreshonly' => 'true')
              .that_subscribes_to('File[/etc/zabbix/zabbix_agentd.d/userparameter_pg_monz.conf')
          end
          


        end
      end
    end
  end
end
