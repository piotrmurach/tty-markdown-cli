# frozen_string_literal: true

require "open3"
require "tempfile"

RSpec.describe "tty-markdown command" do
  let(:cmd) { RSpec::Support::OS.windows? ? "tty-markdown" : "exe/tty-markdown" }

  it "runs with piped input" do
    out, status = Open3.capture2("echo **bold** | #{cmd}")

    expect(out).to match(/\e\[33;1mbold\e\[0m/)
    expect(status.exitstatus).to eq(0)
  end

  it "runs with text input" do
    out, status = Open3.capture2("#{cmd} \"#Header\"")

    expect(out).to match(/\e\[36;1;4mHeader\e\[0m/)
    expect(status.exitstatus).to eq(0)
  end

  it "runs with file path" do
    tempfile = Tempfile.new("markdown")
    begin
      tempfile.write("#Header")
      tempfile.rewind

      out, status = Open3.capture2("#{cmd} #{tempfile.path}")

      expect(out).to match(/\e\[36;1;4mHeader\e\[0m/)
      expect(status.exitstatus).to eq(0)
    ensure
      tempfile.close
      tempfile.unlink
    end
  end

  it "uses only ASCII symbols" do
    out, status = Open3.capture2("#{cmd} --ascii \"* list item\"")

    expect(out).to match(/\e\[33m\*\e\[0m list item/)
    expect(status.exitstatus).to eq(0)
  end

  it "specifies maximum number of colors" do
    out, status = Open3.capture2("#{cmd} --colors 16 '\`foo = {}\`'")

    expect(out).to match(/\e\[33mfoo = {}\e\[0m/)
    expect(status.exitstatus).to eq(0)
  end

  it "specifies zero colors" do
    out, status = Open3.capture2("#{cmd} --colors 0 '\`foo = {}\`'")

    expect(out).to match(/^foo = {}/)
    expect(status.exitstatus).to eq(0)
  end

  it "changes output indentation" do
    out, status = Open3.capture2("#{cmd} --indent 1 \"### Header\"")

    expect(out).to match(/^  \e\[36;1mHeader\e\[0m/)
    expect(status.exitstatus).to eq(0)
  end

  it "sets maximum output width" do
    out, status = Open3.capture2("#{cmd} --width 30 \"It is not down on any map; true places never are.\"")

    expect(out).to eq("It is not down on any map; \ntrue places never are.\n")
    expect(status.exitstatus).to eq(0)
  end

  it "prints help" do
    out, err, status = Open3.capture3("#{cmd} --help")

    expect(out).to eq([
      "Usage: tty-markdown [options] [file]",
      "    -a, --ascii                      Use ASCII symbols (default UTF-8)",
      "    -c, --colors n                   Maximum number of colors (default auto detect)",
      "    -i, --indent n                   Indentation amount (default 2 spaces)",
      "    -w, --width n                    Maximum output width (default full terminal)",
      "    -h, --help                       Display help",
      "    -v, --version                    Display the version\n"
    ].join("\n"))
    expect(err).to eq("")
    expect(status.exitstatus).to eq(0)
  end

  it "prints error messsage and exits with 1" do
    out, err, status = Open3.capture3("#{cmd} --unknown")

    expect(out).to eq("")
    expect(err).to eq("invalid option: --unknown\n")
    expect(status.exitstatus).to eq(1)
  end
end
