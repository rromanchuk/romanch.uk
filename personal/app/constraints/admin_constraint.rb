class AdminConstraint
  def matches?(request)
    cookies = ActionDispatch::Cookies::CookieJar.build(request, request.cookies)
    session = RyanRomanchuk::Session.find_by(id: cookies.signed[:session_id])
    if (user = session&.user)
      true
    else
      false
    end
  end
end
