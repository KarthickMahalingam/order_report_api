Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'report' =>'reports#show'
  get 'report/:report_type' => 'periodic_report#show'
  get 'report/:report_type/export' => 'export_report#show'
  get 'report/:report_type/:start_range/:end_range' => 'periodic_report#show'
  get 'report/:report_type/:start_range/:end_range/export' => 'export_report#show'
  get 'report/customer/:customer_id' => 'customer_order#show'
end
