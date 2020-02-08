module ApplicationHelper

# (undefined local variable or method `devise_mapping')とのエラー文により以下を追加
def resource_name
   :admin
end

def resource
   @resource ||= admin.new
end

def devise_mapping
   @devise_mapping ||= Devise.mappings[:admin]
end
end
