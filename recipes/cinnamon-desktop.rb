#  Recipe for installing/configuring cinnamon-desktop
package('lightdm')

apt_repository 'cinnamon' do
  uri          'http://ppa.launchpad.net/lestcape/cinnamon'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'FA2AF90A'
end

package('cinnamon')
