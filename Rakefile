# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'rubygems'
require 'bundler'
require 'motion-cocoapods'
require 'nano-store'

Bundler.require


Motion::Project::App.setup do |app|

  # Use `rake config' to see complete project settings.
  app.name = 'NNStore-Example'
  app.icons << 'n.jpg'
  app.pods do
    pod 'NanoStore', '~> 2.1.8'
  end
end



