# Display modules collection module
# Provides display manager and graphical session modules
# Be careful when adding or removing modules, as it may affect graphical login

{ ... }: {
  imports = [
    ./managers
    ./sessions
  ];
}
