class ExternalSitesController < ApplicationController
  def mbcw
    @link_text = "www.mybenefitscalwin.org"
    @link_url = "https://www.mybenefitscalwin.org/"
    render :shell_for_outbound_linking
  end

  def c4
    @link_text = "www.c4yourself.org"
    @link_url = "https://www.c4yourself.com/"
    render :shell_for_outbound_linking
  end

  def leader
    @link_text = "dpssbenefits.lacounty.gov"
    @link_url = "https://www.dpssbenefits.lacounty.gov/"
    render :shell_for_outbound_linking
  end

  def getcalfresh
    @link_text = "www.getcalfresh.org"
    @link_url = "https://www.getcalfresh.org/"
    render :shell_for_outbound_linking
  end

  def cfa
    redirect_to 'https://www.codeforamerica.org'
  end
end
