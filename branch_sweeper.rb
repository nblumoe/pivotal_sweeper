require 'rubygems'
require 'bundler/setup'

require './config'

persistent_branches = ["master", "staging", "prestage", "HEAD -> master", "* master"]

Dir.chdir(GIT_DIR)
`git branch -r --merged`.each_line do |remote_branch|
  branch = remote_branch.gsub("origin/", "").chomp.strip
  unless persistent_branches.include?( branch )
    `git push origin :#{branch}`
  end
end
#`git branch --merged`.each_line do |branch|
#  branch = branch.chomp.strip
#  unless persistent_branches.include?( branch )
#    `git br -d #{branch}`
#  end
#end
