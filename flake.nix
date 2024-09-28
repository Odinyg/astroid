{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in pkgs.mkShell {
      packages = with pkgs; [ (python312.withPackages (ps: [ ps.pygame ])) ];
    };
  };
}
#{ pkgs ? import <nixpkgs> {} }:
#
#let
#  python = pkgs.python312;
#  pythonPackages = python.pkgs;
#in
#pkgs.mkShell {
#  buildInputs = [
#    python
#    pythonPackages.pygame
#    # Add any other dependencies you might need
#  ];
#
#  shellHook = ''
#    echo "Python ${python.version} with Pygame environment"
#    
#    # Create a virtual environment if it doesn't exist
#    if [ ! -d "venv" ]; then
#      echo "Creating a new virtual environment..."
#      python -m venv venv
#    fi
#    
#    # Activate the virtual environment
#    source venv/bin/activate
#    
#    pip install --upgrade pip
#
#    # Install packages from requirements.txt if it exists
#    if [ -f "requirements.txt" ]; then
#      echo "Installing packages from requirements.txt..."
#      pip install -r requirements.txt
#    else
#      echo "No requirements.txt found. Create one to specify your Python dependencies."
#    fi
#
#    # Set VIRTUAL_ENV_DISABLE_PROMPT to avoid the default prompt change
#    export VIRTUAL_ENV_DISABLE_PROMPT=1
#    
#    # Update the prompt to indicate the activated venv
#    export PS1="(venv) $PS1"
#  '';
#}
