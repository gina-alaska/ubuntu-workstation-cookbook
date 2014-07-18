#  Recipe for installing/configuring cinnamon-desktop
package('lightdm')

apt_repository 'mint-cinnamon' do
  uri  'http://packages.linuxmint.com/'
  distribution 'qiana'
  components ['main','upstream', 'import']
  trusted true
end

package('linuxmint-keyring')
package('cinnamon')
