require 'rake'

namespace :uw do |variable|
	desc 'Run a recipe in an ubuntu workstation VM'
	task :run, :recipe_name do |t, args|
		recipe_name = args.to_hash.fetch(:recipe_name)

		ENV['UW_RUN_LIST'] = recipe_name
		sh('vagrant destroy -f')
		sh('vagrant up')
	end


end