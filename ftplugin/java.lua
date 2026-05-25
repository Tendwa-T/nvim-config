local config = {
    -- This points to the jdtls binary installed by Mason
    cmd = { '~/.local/share/nvim/mason/bin/jdtls' },
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
}
require('jdtls').start_or_attach(config)
