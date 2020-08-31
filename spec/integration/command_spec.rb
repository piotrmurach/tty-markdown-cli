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

  it "prints help" do
    out, err, status = Open3.capture3("#{cmd} --help")

    expect(out).to eq([
      "Usage: tty-markdown [options] [file]",
      "    -a, --ascii                      Use ASCII symbols (default UTF-8)",
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
