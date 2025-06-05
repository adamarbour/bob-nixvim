{ lib, config, ... }:
{
  imports = [];
  
  config = {
    opts = {
      # Enable relative line numbers
      number = true;
      relativenumber = true;
      
      # Set tab to 2 spaces
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;
      
      # Enable auto indenting and set it to spaces
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;
    };
  };
}
