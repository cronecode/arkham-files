class ClientController < ApplicationController
  def show
    @mainjs = '/' + JSON.parse(File.read(Rails.root.join('client', 'build', 'asset-manifest.json')))['main.js']

    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
