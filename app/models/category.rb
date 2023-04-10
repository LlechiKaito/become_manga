class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '恋愛' },
    { id: 3, name: '文芸' },
    { id: 4, name: 'ファンタジー' },
    { id: 5, name: 'SF' },
    { id: 6, name: '異世界転生/転移' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :works
end