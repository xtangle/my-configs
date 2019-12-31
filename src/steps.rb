module Provision
  module MyConfigsSteps
    SCRIPTS_DIR = '${HOME}/Projects/my-configs/scripts'

    def prepare(config, provision_vars)
      super
      Utils::provision_script(config, 'my-configs', 'prepare', "#{SCRIPTS_DIR}/prepare/prepare-my-configs.sh", 'always')
      Utils::provision_script(config, 'my-configs', 'prepare', "#{SCRIPTS_DIR}/prepare/prepare-secrets.sh", 'always')
    end

    def install(config, provision_vars)
      super
      Utils::provision_script(config, 'my-configs', 'install', "#{SCRIPTS_DIR}/install/install-utils.sh")
      Utils::provision_script(config, 'my-configs', 'install', "#{SCRIPTS_DIR}/install/install-fonts.sh", 'always')
      Utils::provision_script(config, 'my-configs', 'install', "#{SCRIPTS_DIR}/install/install-starship.sh")
    end

    def configure(config, provision_vars)
      super
      Utils::provision_script(config, 'my-configs', 'configure', "#{SCRIPTS_DIR}/configure/configure-tilda.sh", 'always')
      Utils::provision_script(config, 'my-configs', 'configure', "#{SCRIPTS_DIR}/configure/configure-yarn.sh") # takes too long to always run
      Utils::provision_script(config, 'my-configs', 'configure', "#{SCRIPTS_DIR}/configure/configure-intellij.sh", 'always')
      Utils::provision_script(config, 'my-configs', 'configure', "#{SCRIPTS_DIR}/configure/import/import-all.sh", 'always')
    end


    def cleanup(config, provision_vars)
      super
      Utils::provision_script(config, 'my-configs', 'cleanup', "#{SCRIPTS_DIR}/cleanup/git-clone-all.sh", 'always')
      Utils::provision_script(config, 'my-configs', 'cleanup', "#{SCRIPTS_DIR}/cleanup/git-pull-all.sh", 'always')
    end
  end
end
