@user = User.new(
    name: "suporte",
    email: "sistemas.untec@codhab.df.gov.br",
    password: "codhab123456789",
    password_confirmation: "codhab123456789"
)

@user.save!