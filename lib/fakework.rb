module FakeWork
	def FakeWork.git_work
		#prints gake git stayemnets to the screen as if you just pushed something
	puts '➜  repo.github.fake git:(development) ✗ git commit -m "User wants to get good at counting cards and become a millionaire"'
	puts '[development 3a21d20] change file name'
	puts '4 file changed, 75 insertions(+), 24 deletions(-)'
	puts ' rename file.html => new_file_name.html (100%)'
	puts '➜  repo.github.fake git:(development) git push origin development'
	puts 'Counting objects: 6, done.'
	puts 'Delta compression using up to 8 threads.'
	puts 'Compressing objects: 100% (2/2), done.'
	puts 'Writing objects: 100% (2/2), 274 bytes | 0 bytes/s, done.'
	puts 'Total 2 (delta 0), reused 0 (delta 0)'
	puts 'To https://github.com/random/boss-dont-look/work'
	puts '   736bdh4..3a7dhs0  development -> development'
	end

	def FakeWork.up_to_date
		puts 'On branch master'
		puts 'Your branch is up-to-date with origin/development.'
		puts 'nothing to commit, working directory clean'
	end
end
