RSpec::Matchers.define :only_be_now do |attribute|
  match do |flash|
    flash.send(:now_is_loaded?)
  end
end