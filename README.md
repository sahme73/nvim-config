# Installation

## Linux

### Steps

1. Extract release config to `~/.config/` and data to `~/.local/share/` on offline machines.
2. Clone repository to `~/.config/` on online machines and let lazy.nvim install all plugins.

### External Dependencies

Use `yum --nogpgcheck` on offline machines setup with static repositories or `dnf` on online machines.

#### Base Installation
1. `yum install --nogpgcheck ripgrep`
2. `yum install --nogpgcheck fd-find`
3. `yum install --nogpgcheck diffutils`
4. `yum install --nogpgcheck unzip`

Cannot prepackage mason.nvim LSP installations because must rebuild all LSP installations on destination machine due to hard path links.

#### C/C++ LSP
1. `yum install --nogpgcheck clang`
2. `yum install --nogpgcheck clang-tools-extra`

#### Java LSP
1. `yum install --nogpgcheck java-21-openjdk-jmods`
2. `yum install --nogpgcheck java-latest-openjdk-devel.x86_64`
3. `yum install --nogpgcheck java`
4. `yum install --nogpgcheck maven`
5. download, extract, and link `jdtl` from `http://download.eclipse.org/jdtls/milestones/?d` to `/usr/bin/jdtls`

#### Typescript LSP
1. `yum install --nogpgcheck npm`
2. `npm install -g typescript typescript-language-server` (transfer node module from online machine `npm root -g`)
3. `npx ts-node` to run individual typescript files
