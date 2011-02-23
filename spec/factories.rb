Factory.define :alerte do |f|
  f.sequence(:titre) {|n| "alerte#{n}"}
end

Factory.define :event do |f|
  f.sequence(:titre) {|n| "event#{n}"}
  f.sequence(:start_at) {|n| Time.now + n.hours}
  f.end_at {|a| a.start_at + 1.hour}
end

Factory.define :document do |f|
  f.sequence(:titre) {|n| "document#{n}"}
end

