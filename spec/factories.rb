Factory.define :alerte do |f|
  f.sequence(:titre) {|n| "titre#{n}"}
end
