local platform = require('utils.platform')
local wezterm = require 'wezterm'

local options = {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains ={
      {
         name = 'cc-master',
         remote_address = '106.15.44.120',
         username='root',
         multiplexing = 'None',
         default_prog = { 'bash', '-l' },
         assume_shell = 'Posix',
         ssh_option = {
            identityfile = '/Users/chomoe/.ssh/id_rsa.pub',
          },
      },
      {
         name = 'aku-master',
         remote_address = '47.243.140.134',
         username='root',
         multiplexing = 'None',
         default_prog = { 'bash', '-l' },
         assume_shell = 'Posix',
      },
      {
         name = 'chomoe',
         remote_address = '124.221.100.68',
         username='ubuntu',
         multiplexing = 'None',
         default_prog = { 'bash', '-l' },
         assume_shell = 'Posix',
         ssh_option = {
            identityfile = '/Users/chomoe/.ssh/id_rsa.pub',
          },
      },
   },

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}

if platform.is_win then

   table.insert(options.ssh_domains, 1,{
      name = 'ssh:wsl',
      remote_address = 'localhost',
      multiplexing = 'None',
      default_prog = { 'fish', '-l' },
      assume_shell = 'Posix',
   })

   options.wsl_domains = {
   }
end

return options
