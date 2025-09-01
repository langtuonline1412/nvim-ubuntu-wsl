# Ubuntu

~/.config/nvim/

# Sửa lỗi Neovim
## Version Neovim quá thấp

nvim-lspconfig requires Nvim version 0.10, but you are running: 0.9.5

Plugin nvim-lspconfig và một số plugin khác (ví dụ Mason, Lazy.nvim) đã drop support cho Neovim 0.9.

Cách fix:
Bạn cần update Neovim lên >= 0.10.0.
Trên Ubuntu bạn có thể chạy:

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim

Sau đó kiểm tra lại:

nvim --version

phải thấy NVIM v0.10.x.

## Lỗi Mason + lspconfig

attempt to call field 'enable' (a nil value)

Nguyên nhân: Plugin mason-lspconfig bạn đang dùng yêu cầu API mới chỉ có từ Neovim 0.10 trở lên.
Khi chạy trên 0.9.5 thì function đó không tồn tại → crash.

Cách fix: Sau khi nâng cấp Neovim lên 0.10, xóa cache plugin rồi cài lại:

rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim/mason

Rồi mở lại nvim, Lazy.nvim sẽ tự cài plugin lại.

## Lỗi Clangd

No C compiler found! "cc", "gcc", "clang", "cl", "zig" are not executable.
[mason-lspconfig.nvim] failed to install clangd

Nguyên nhân: Mason khi cài clangd cần có C/C++ compiler trong hệ thống.
Hiện tại máy bạn không có gcc / clang / zig / cl nên Mason không build được.

Cách fix:

Cài compiler đầy đủ:

sudo apt update
sudo apt install build-essential clang clangd

Kiểm tra lại sau khi cài:
gcc --version
clang --version
clangd --version

Nếu bạn cần Zig (tùy plugin), có thể cài:

sudo apt install zig

Sau khi cài compiler
Mở lại Neovim và chạy:

:Mason

rồi cài lại clangd

## Lỗi unzip

clangd failed to install
# [6/6] spawn: unzip failed with exit code - and signal -. Could not find executable

Đây không còn là lỗi clangd nữa, mà là Mason không tìm thấy lệnh unzip trong hệ thống để giải nén gói cài đặt.

cách fix:
chỉ cần cài unzip:

sudo apt update
sudo apt install unzip

Sau đó:
Mở lại Neovim gõ:

:Mason

Chọn clangd -> Enter để cài lại.

## Ghi chú:
Nếu bạn đã cài clangd bằng apt trước đó (sudo apt install clangd), thì thật ra không cần cài qua Mason nữa.
Bạn có thể để Mason bỏ qua clangd, chỉ cần lspconfig trỏ đến binary clangd đã có sẵn.

Ví dụ trong configs/lsp.lua:

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  cmd = { "clangd" }, -- sẽ gọi clangd từ PATH
}
