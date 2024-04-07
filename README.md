# Installation

## Linux

### Steps

1. Extract release config to `~/.config/` and data to `~/.local/share/` on offline machines.
2. Clone repository to `~/.config/` on online machines and let lazy.nvim install all plugins.

### External Dependencies

Use `yum --nogpgcheck` on offline machines setup with static repositories or `dnf`.

#### Base Installation
1. `dnf install ripgrep`
2. `dnf install fd-find`
3. `dnf install diffutils`
4. `dnf install unzip`

Cannot prepackage mason.nvim LSP installations because must rebuild all LSP installations on destination machine due to hard path links.

#### C/C++ LSP
1. `yum install --nogpgcheck clang`
2. `yum install --nogpgcheck clang-tools-extra`

#### Java LSP
1. `dnf install java-21-openjdk-jmods`
2. `dnf install java-latest-openjdk-devel.x86_64`
3. `dnf install java`
4. `dnf install maven`

#### Typescript LSP
1. `dnf install npm`
2. `npm install -g typescript typescript-language-server`
3. `npx ts-node` to run individual typescript files
