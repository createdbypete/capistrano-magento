# Capistrano::Magento

[Magento](http://magento.com) specific tasks and defaults for [Capistrano](https://github.com/capistrano/capistrano) deployment.

## Installation

    $ gem install capistrano-magento

## Usage

First install Capistrano into your Magneto project, this will create some new files and directories.

    $ cd /my/magento/project
    $ cap install

Now update your `Capfile`:

    # Capfile
    require 'capistrano/magento'

A number of defaults have been set on the following options, you can of course override these with your own values:

    # config/deploy.rb
    set :linked_dirs,  [ "var", "media", "sitemaps" ]
    set :linked_files, [ "app/etc/local.xml" ]

Configure your stages, check out the [getting started guide for Capistrano](http://capistranorb.com/documentation/getting-started/preparing-your-application/)

    $ tree config/deploy
    config/deploy
    ├── production.rb
    └── staging.rb

These are the available Magento specific tasks, most of these are shortcuts to the shell commands already available in Magento:

    $ cap -T
    ...
    cap magento:clear_cache            # Clear the Magento Cache
    cap magento:compiler:clear         # Disable compiler include path and remove compiled files
    cap magento:compiler:compile       # Run compilation process and enable compiler include path
    cap magento:compiler:disable       # Disable compiler include path
    cap magento:compiler:enable        # Enable compiler include path
    cap magento:indexer:reindexall     # Reindex data by all indexers
    cap magento:logs:clean             # Clean logs
    cap magento:maintenance:off        # Turn off maintenance mode by removing maintenance.flag file
    cap magento:maintenance:on         # Turn on maintenance mode by creating maintenance.flag file

Run them in the standard Capistrano way, for example

    $ cap production magento:maintenance:on

Checkout the [Capistrano documentation](http://capistranorb.com/) and [Readme](https://github.com/capistrano/capistrano/blob/master/README.md) for more information about setting up deployment.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
