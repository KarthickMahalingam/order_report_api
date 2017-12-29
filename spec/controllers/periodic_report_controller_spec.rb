require 'rails_helper'
RSpec.describe PeriodicReportController, type: :controller do
  let(:report_type) { %w[daily weekly monthly].sample }
  describe 'PeriodicReportController' do
    it 'should validate the route path' do
      expect(get: "report/#{report_type}").to route_to(controller: 'periodic_report',
                                                       action: 'show',
                                                       report_type: report_type)
    end
  end
end
