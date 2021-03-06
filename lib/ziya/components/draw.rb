# -----------------------------------------------------------------------------
# Sets up a drawing area on the chart to draw text, rect, circles...
#
# Author:: Fernand Galiana
# -----------------------------------------------------------------------------
require 'ziya/ziya_helper'

module Ziya::Components
  # Sets up a drawing area on the chart to draw text, rect, circles...
  #
  # Holds any number of elements to draw. A draw element can be a circle, image (JPEG or SWF),
  # line, rectangle, or text. Use draw "image" to include SWF flash file with animation,
  # roll-over buttons, sounds, scripts, etc.
  #
  # <tt></tt>:
  #
  # See http://www.maani.us/xml_charts/index.php?menu=Reference&submenu=draw
  # for additional documentation, examples and futher detail.
  #  
  class Draw < Base  
    include Ziya::Helper
    
    has_attribute :components
    
                     
    # -------------------------------------------------------------------------
    # Dump has_attribute into xml element
    def flatten( xml, composite_urls=nil )
      if components
        xml.draw do 
          components.each { |comp| comp.flatten( xml ) }
          gen_composites( xml, composite_urls ) if composite_urls
        end
      end
    end
    
    # -------------------------------------------------------------------------
    # Generates Draw component for composite charts
    def gen_composites( xml, composite_urls )
      # chart_path = chart_path
      for url in composite_urls do
        # xml.image( :url => composite_url % [ chart_path, chart_path, url] )
        xml.image( :url => gen_composite_path( chart_path, url ) )
      end
    end
  end
end