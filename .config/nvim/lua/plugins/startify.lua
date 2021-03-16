local g, cmd = vim.g, vim.cmd

g.ascii = {
 ' _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_     _|_ ',
 '  |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |  ',
}

g.startify_custom_header = 'startify#center(g:ascii)'

g.startify_lists = {
   { type ='sessions',                    header = {'          Sessions' }           },
   { type ='commands',                    header = {'        גּ  Commands' }           },
   { type ='files',                       header = {'          Files'    }           },
   { type ='bookmarks',                   header = {'          Bookmarks'}           },
 }

g.startify_commands = {
   { p = {'Telescope Find Files'   , ':Telescope find_files' }},
   { z = {'Telescope z'            , ':Telescope z list'    }},
   { t = {'Telescope builtin'      , ':Telescope'      }},
   { h = {'Check Vim health'       , ':checkhealth'    }},
   { i = {'Install Plugins'        , ':PackerInstall'  }},
   { u = {'Update Plugin'          , ':PackerUpdate'   }},
   { c = {'Clean Plugin'           , ':PackerClean'    }},
   }

g.startify_session_sort = 1
g.startify_change_to_dir = 1
g.startify_session_autoload = 1
g.startify_session_delete_buffers = 0
g.startify_session_persistence = 1
g.startify_change_to_vcs_root = 1
g.startify_padding_left = 6
g.webdevicons_enable_startify = 1
g.startify_enable_special = 1
g.startify_files_number = 10
g.startify_update_oldfiles = 1
g.startify_change_to_dir = 1

