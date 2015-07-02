class Nav < ActiveRecord::Base
  belongs_to :project
  belongs_to :page

  scope :actives, -> { where(status: true)}

  enum :nav_type  => [:link, :pagina]
  enum :target    => [:_blank, :_self, :_top]

  
  validates_presence_of :name, :nav_type, :target

  validates :page, presence: true, if: :nav_page?
  validates :url, presence: true, if: :nav_url?

  before_create :set_order

  private

  def set_order
    nav = project.navs.all.last
    self.order = (nav.present?) ? nav.order + 1 : 0
  end

  def nav_url?
    self.link?
  end

  def nav_page?
    self.pagina?
  end
end
