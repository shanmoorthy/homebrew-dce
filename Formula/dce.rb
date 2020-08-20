class Dce < Formula
    desc "Disposable Cloud Environment CLI"
    homepage "https://github.com/Optum/dce-cli"
    version "0.5.0"
    bottle :unneeded
  
    if OS.mac?
        url "https://github.com/Optum/dce-cli/releases/download/v0.5.0/dce_darwin_amd64.zip"
        sha256 "3056abbcd1a7fc55bc149aa71dd763dbd007a7433487cd66293c32b393419e53"
    elsif OS.linux?
        if Hardware::CPU.arm?
            if Hardware::CPU.is_64_bit?
                url "https://github.com/Optum/dce-cli/releases/download/v0.5.0/dce_linux_amd64.zip"
                sha256 "cb140c743373e28a6c1bd4ba3fe1b81a7431dd538e1ad430fede3c1aff4508db"
            end
        end
    end

    def install
        bin.install "dce"
    end

    test do
        help_text = shell_output("#{bin}/dce --help")
        assert_includes help_text, "Usage:"
    end
end