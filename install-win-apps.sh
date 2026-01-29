install_windows_app() {
    local app_id=$1
    # winget list で ID を検索し、見つからなければインストール
    if ! winget.exe list --id "$app_id" > /dev/null 2>&1; then
        echo "Installing $app_id..."
        winget.exe install "$app_id" --silent
    else
        echo "$app_id is already installed. Skipping."
    fi
}

if [ -e /etc/wsl.conf ]; then
    echo "Windows側のツールをインストール中..."
    # .exeをつけて呼び出すのがポイント
    winget.exe install Microsoft.VisualStudioCode
    winget.exe install Google.Chrome
fi

