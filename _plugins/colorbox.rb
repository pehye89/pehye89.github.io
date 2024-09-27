module Jekyll
    class ColorBoxesOrDetails < Liquid::Block
      def initialize(tag_name, markup, tokens)
        super
        # Split the markup to identify both box type/details and an optional title
        if markup.strip.include?(" ")
          @type, @title = markup.strip.split(" ", 2)
          @title = @title&.gsub(/^"(.*)"$/, '\1') # Unquote the title if it's in quotes
        else
          @type = markup.strip
          @title = nil
        end
      end
  
      def render(context)
        content = super
        title_html = @title ? "<div class=\"title\">#{@title}</div>" : ""
  
        case @type
        when "info", "tip", "warning", "danger"
          # Generate the box type based on the tag (info, tip, warning, danger)
          case @type
          when "info"
            "<div class=\"box-info\" markdown=\"1\">#{title_html}#{content}</div>"
          when "tip"
            "<div class=\"box-tip\" markdown=\"1\">#{title_html}#{content}</div>"
          when "warning"
            "<div class=\"box-warning\" markdown=\"1\">#{title_html}#{content}</div>"
          when "danger"
            "<div class=\"box-danger\" markdown=\"1\">#{title_html}#{content}</div>"
          end
        when "details"
          # Generate the <details> block if the type is 'details'
          summary_html = @title ? "<summary>#{@title}</summary>" : ""
          "<details class=\"details-block\" markdown=\"1\">#{summary_html}#{content}</details>"
        else
          # If the tag type is unknown, just render the content without any additional styling
          "#{content}"
        end
      end
    end
  end
  
  Liquid::Template.register_tag('box', Jekyll::ColorBoxesOrDetails)
  