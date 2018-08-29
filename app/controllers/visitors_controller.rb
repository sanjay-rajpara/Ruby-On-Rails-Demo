class VisitorsController < ApplicationController
	def index
    @slider = Slider.where(:status => 'Enabled').order("display_order ASC")
    @testimonial = Testimonial.where(:status => 'Enabled').order("display_order ASC")
    @page = Page.where(:status => 'Enabled').order("display_order ASC")
  end
  def about
    @team = Team.where(:status => 'Enabled').order("display_order ASC")
    @about = About.where(:status => 'Enabled').order("display_order ASC")
    @page = Page.where(:status => 'Enabled').order("display_order ASC")
  end
  def view
    @page = Page.where(:status => 'Enabled').order("display_order ASC")
  end
  def contact
    @page = Page.where(:status => 'Enabled').order("display_order ASC")
  end
  
end
