module Provision
  module MyConfigsSteps
    MY_CONFIGS_CONTEXT_KEY = 'my-configs'
    MY_CONFIGS_SCRIPTS_DIR = '${HOME}/Projects/my-configs/scripts'

    def post_prepare(config, provision_vars)
      super
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_prepare', "#{MY_CONFIGS_SCRIPTS_DIR}/prepare/prepare-my-configs.sh")
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_prepare', "#{MY_CONFIGS_SCRIPTS_DIR}/prepare/prepare-secrets.sh")
    end

    def post_install(config, provision_vars)
      super
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_install', "#{MY_CONFIGS_SCRIPTS_DIR}/install/install-utils.sh")
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_install', "#{MY_CONFIGS_SCRIPTS_DIR}/install/install-fonts.sh")
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_install', "#{MY_CONFIGS_SCRIPTS_DIR}/install/install-starship.sh")
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_install', "#{MY_CONFIGS_SCRIPTS_DIR}/install/install-lazydocker.sh")
    end

    def post_configure(config, provision_vars)
      super
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_configure', "#{MY_CONFIGS_SCRIPTS_DIR}/configure/configure-tilda.sh")
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_configure', "#{MY_CONFIGS_SCRIPTS_DIR}/configure/configure-yarn.sh")
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_configure', "#{MY_CONFIGS_SCRIPTS_DIR}/configure/configure-intellij.sh")
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_configure', "#{MY_CONFIGS_SCRIPTS_DIR}/configure/import/import-all-configs.sh")
    end

    def post_cleanup(config, provision_vars)
      super
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_cleanup', "#{MY_CONFIGS_SCRIPTS_DIR}/cleanup/git-clone-all.sh")
      Utils::provision_script(config, MY_CONFIGS_CONTEXT_KEY, 'post_cleanup', "#{MY_CONFIGS_SCRIPTS_DIR}/cleanup/git-pull-all.sh")
    end
  end
end
