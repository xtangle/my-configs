module Provision
  module MyConfigsSteps
    SCRIPTS_DIR = '${HOME}/Projects/my-configs/scripts'

    def prepare(config, provision_vars)
      super
      Utils::provision_script(config, 'prepare', "#{SCRIPTS_DIR}/prepare/prepare-my-configs.sh")
      Utils::provision_script(config, 'prepare', "#{SCRIPTS_DIR}/prepare/prepare-secrets.sh")
    end

    def install(config, provision_vars)
      super
      Utils::provision_script(config, 'install', "#{SCRIPTS_DIR}/install/install-utils.sh")
    end

    def configure(config, provision_vars)
      super
      Utils::provision_script(config, 'configure', "#{SCRIPTS_DIR}/configure/configure-tilda.sh")
      Utils::provision_script(config, 'configure', "#{SCRIPTS_DIR}/configure/configure-yarn.sh")
      Utils::provision_script(config, 'configure', "#{SCRIPTS_DIR}/configure/configure-intellij.sh")
      Utils::provision_script(config, 'configure', "#{SCRIPTS_DIR}/configure/import/import-configs.sh")
    end


    def cleanup(config, provision_vars)
      super
      Utils::provision_script(config, 'cleanup', "#{SCRIPTS_DIR}/cleanup/git-clone-all.sh")
      Utils::provision_script(config, 'cleanup', "#{SCRIPTS_DIR}/cleanup/git-pull-all.sh")
    end
  end
end
