# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

require 'vagrant-aws'

Vagrant.configure(2) do |config|
    config.vm.box = "aws-dummy"
    config.vm.provider 'aws' do |aws, override|
    # this first line can actually be omitted
    
        aws.aws_dir = ENV['HOME'] + "/.aws/"
        aws.aws_profile = "config"

        aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
        aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']

        aws.keypair_name = 'vagrant'

        aws.region = 'us-west-2'
        aws.ami = 'vagrant'
        aws.security_groups = ['dmoj']

        override.ssh.username = 'ubuntu'
        override.ssh.private_key_path = '~/.ssh/Minkov-Lenovo.pem'
    end
end
