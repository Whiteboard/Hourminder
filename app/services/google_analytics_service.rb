require 'google/apis/analytics_v3'
class GoogleAnalyticsService

  attr_accessor :account_json

  SCOPE = 'https://www.googleapis.com/auth/analytics.readonly'


  def initialize
    @analytics = Google::Apis::AnalyticsV3::AnalyticsService.new
    @analytics.authorization = Google::Auth::ServiceAccountCredentials.make_creds({
     "json_key_io": get_account_json, 
     "scope": SCOPE
    })
  end

  def get_account_json
    self.account_json || StringIO.new('{
        "type": "service_account",
        "project_id": "whiteboard-impact-dashboard",
        "private_key_id": "45f7da29d89b30710d151f847833a87027404ca4",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDkyg59R+ABq+5A\nv4lwY0Qt6ogprmd7oLEAybDDtVW5/ePCn8iyuQ4JSaOOkOVZWBKlUjAuj1hQjn2N\nr7/j95xMfIhMxL+kc2p/PsIPFA/cCncZ1+W+mog5JsxWas2vfnLkhC/YVFJKGAWL\nzYB6bGxDDMgfXx4y96+yeaCsGf3XlDCptP7kDEKbMk/Wv9dYdzVedQAbSFNcaRKE\npBxHsYfWHT12DbASmd4RcDipiDo9CSI2LEkofHj9inT8Pdkh9Bop/lggjjRWhAAh\nLiMatDQHCGWVk4Dsz8CtFjLr+F5m7jAUsVK2abSiQxRO7p5teentAR1EFyppHjmb\nbbS2a7hlAgMBAAECggEBAOMN4/NRMW53QqvfanavDSrEZv12qBx5DTDK+TJA9CLx\nZOfxyywTm2p8OmVyRyqzzU1kk4yhlfPcdZ33nWiQg/0kWeBWIhsCr944Wj68mkC1\n4h0ztj3C/w45AvGAbUCNLVi8Fv+KL2B5Fof4Gllk4MxqEvGPZFkQlr15F4u0/8bA\n2i0TtB2LJFX3wo2oQ2ThLadd+VN/3IUNH2bdB6zaUjYvcHLWK1gSvn8+O39f+17S\n5uY8gVXBXfn/KgcXViVsbS2Vke9yR5MJsxS88OSPQJcpOegLAEeEK6I/s5R2jzFy\nKikC/bZMGjqSd3ktfHm1LIdvyHzaN2OiuvfQNlE89sECgYEA+gDGabfQtrRz4s9w\nkURzP8WPbqzF2D25jyeLLrlanDyWrLM5RlxlXrIt+b1thE3YT9E/JWvd59VCvAyi\nPUEZ8jc0YiE+4Pri52J7PaO06ODhNo7nfh+jSXKr8LMzVGtHCuslBWrTGBrZIhAv\n+am9kuL3yUgMKtqb3eXB0uDZ74MCgYEA6kcC+4FBBJ+IW8BrGvNQBnD8nWQ1VaEi\nneySeoWT8sbs4FrELBCFZYs6tZRlS7KND2Hz+WhYldX7IIIF7KCK+/OIp/MTaD7H\n7d0t7jZyFGWoaFRtwdzWXUGs/a/RjpSOCOefa50KnMEtKm/5EEzkbnrXk6rK3xG2\ncgZdCvPJC/cCgYA8mZ9+1M3E2+0TV5FDxUHifXMNMtgqWJv4NW+pfciXAqDLcA48\nHf18fNhkJyS641vBzUjvOzxpC+rHRpC1JGizq+oIt2JUirwhtl+FS394y7oLzYwT\nqHuePCuthuK0XeS0otcwfvp4Z1mmxiG69Qg86MODiPFaGe+aVC0tfs+VHQKBgQCs\nrXScTjPPJYtLHXOUZLyaUtNPaxoIqIEsZ7+7gROAgXD9GMm5NOAt7UZzqhJTjiJ8\nsRUzwt5wakz0NAIL3HU0qdcS+45VatjQEROWnhjNwfQ0Ge7gUlbKW+sW/W13KzXZ\niGev2QuGaLhSrD+m7RX9/JtC40Mu0g5o0xnnRbLtFwKBgQCz444JKmDm2yi5oBiG\nyrmrWPFfBfgh6TawWVOAosmEa7fm+m56lBgrgawdgBHt2NsCPh2WBaAhlERmXlsV\nh47zX6J7VPicHQu4DP2QQyFqgvor7RDMxcaKWtNlYqUfIYOj29ZVbMDKGkMh6NNb\noNglzt3QiraUa9qWIp2K9ARvTw==\n-----END PRIVATE KEY-----\n",
        "client_email": "whiteboard-impact-dashboard@appspot.gserviceaccount.com",
        "client_id": "109873454926308636886",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://accounts.google.com/o/oauth2/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/whiteboard-impact-dashboard%40appspot.gserviceaccount.com"
      }')
  end

  end
