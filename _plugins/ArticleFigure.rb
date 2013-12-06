# -*- coding: utf-8 -*-

# 自动生成图片路径
# 支持插图和表情
module IKnowledge
  class ArticleFigureTag < Liquid::Tag
    def initialize(tag, text, tokens)
      super
      @tag = tag
      value = text.split
      @name = value[0];
      @align = value.length > 1? value[1]: ''
    end

    def render(context)
      if @tag == 'img'
        page = context.registers[:page]
        if @align == ''
          "<img src=\"/resource#{page['url']}#@name\" />"
        else
          "<img align=\"#@align\" src=\"/resource#{page['url']}#@name\" />"
        end
      elsif @tag == 'em'
        "<img src=\"/resource/emotion/#@name.gif\" />"
      end
    end
  end
end

Liquid::Template.register_tag('img', IKnowledge::ArticleFigureTag)
Liquid::Template.register_tag('em', IKnowledge::ArticleFigureTag)
