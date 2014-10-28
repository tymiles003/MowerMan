json.array!(@incomplete_work_orders) do |work_order|
  json.extract! work_order, :id, :urgency, :description
  json.title work_order.plantask.equipment
  json.start work_order.created_at
  json.end work_order.due_date
  json.url work_order_url(work_order, format: :html)
end