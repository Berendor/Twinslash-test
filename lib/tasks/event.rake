namespace :event do

  task :publish do
    Advertising.where(status: 'approved').update(status: 'published')
  end

  task :archive do
    advertising = Advertising.where(status: 'published')
    	advertising.each do |ads|
    			dif = (Time.now - ads.updated_at)/60/60/24
    				if dif > 2
    					ads.update(status: 'archival')
    				end
    		end
      end
      
end
