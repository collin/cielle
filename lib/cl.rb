require "treetop"
require "polyglot"

$LOAD_PATH.push File.dirname(__FILE__)

module Cielle
  Object::CL = self
  def self.load_grammars(*grammars)
    grammars.each{|grammar| require "cl/grammars/#{grammar}" }
  end

  load_grammars :whitespace, :message, :program

  def self.parse(source)
    blocked = blockify(source) || ""
    puts "parsing: \n#{blocked}"
    CL::ProgramParser.new.parse blocked
  end

  def self.blockify(source)
    depth = 0
    lines = []

    source.lines.each_with_index do |line, index|
      line.chomp!
      next if line.blank?
      unless match = line.match(/^[ ]+/)
        if depth == 1
          lines << "#{"  " * depth}}\n" + line
          depth = 0
        else
          lines << line
        end
        next
      end

      indentation = match[0].length
      _depth = indentation / 2

      if indentation / 2 == depth
        lines << line
        next
      end

      raise "Bad identation at line #{index}" unless indentation % 2 == 0

      if _depth < depth
        until depth == _depth
          depth -= 1
          lines << "#{"  " * depth}}"
        end
        lines << line
      elsif _depth = depth + 1
        lines << "{" + line
        depth = _depth
      elsif _depth > depth  + 1
        raise "Too much indentation at line #{line}"
      end
    end
    until depth == 0
      depth -= 1
      lines << "#{"  " * depth}}"
    end
    lines.join("\n").
      gsub("\n{", " {\n")

  end
end
