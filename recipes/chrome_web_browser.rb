#  Recipe for installing/configuring chrome_web_browser
apt_repository 'google-chrome' do
	uri        'https://dl-ssl.google.com/linux/chrome/deb/ stable main'
	arch       'amd64'
	key        'https://dl-ssl.google.com/linux/linux_signing_key.pub'
end

package('google-chrome-stable')
