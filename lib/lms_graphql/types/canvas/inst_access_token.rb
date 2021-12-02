require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasInstAccessToken < BaseType
          description "InstAccess tokens. API Docs: https://canvas.instructure.com/doc/api/inst_access_tokens.html"
        field :token, String, "The InstAccess token itself -- a signed, encrypted JWT.Example: eyJhbGciOiJSU0ExXzUiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0.EstatUwzltksvZn4wbjHYiwleM986vzryrv4R9jqvYDGEY4rt6KPG4Q6lJ3oI0piYbH7h17i8vIWv35cqrgRbb7fzmGQ0Ptj74OEjx-1gGBMZCbZTE4W206XxPHRm9TS4qOAvIq0hsvJroE4xZsVWJFiUIKl_Wd2udbvqwF8bvnMKPAx_ooa-9mWaG1N9kd4EWC3Oxu9wi7j8ZG_TbkLSXAg1KxLaO2zXBcU5_HWrKFRxOjHmWpaOMKWkjUInt-DA6fLRszBZp9BFGoop8S9KDs6f1JebLgyM5gGrP-Gz7kSEAPO9eVXtjpd6N29wMClNI0X-Ppp_40Fp4Z3vocTKQ.c_tcevWI68RuZ0s04fDSEQ.wV8KIPHGfYwxm19MWt3K7VVGm4qqZJruPwAZ8rdUANTzJoqwafqOnYZLCyky8lV7J-m64SMVUmR-BOha_CmJEKVVw7T5x70MTP6-nv4RMVPpcViHsNgE2f1GE9HUauVePw7CrnV0PyVaNq2EZasDgdHdye4iG_-hXXQZRnGYzxl8UceTLBVkpEYHlXKdD7DyQ0IT2BYOcZSpXyW7kEIvAHpNaNbvTPCR2t0SeGbuNf8PpYVjohKDpXhNgQ-Pyl9pxs05TrdjTq1fIctzTLqIN58nfqzoqQld6rSkjcAZZXgr8bOsg8EDFMov5gTv2_Uf-YOm52yD1SbL0lJ-VdpKgXu7XtQ4UmEOj40W4uXF-KmLTjEwQmdbmtKrruhakIeth7EZa3w0Xg6RRyHLqKUheAdTgxAIer8MST8tamZlqW1b9wjMw371zSSjeksF_UjTS9p9i7eTtRPuAbf9geDhKb5e-y29MJaL1eKkhTMiEOPY3O4XGGuqRdRMrbjkNmla_RxiQhFJ3T8Dem-yDRan8gqaJLfRRrvGViz-lty96bQT-Z0hVer1uJhAtkM6RT_DgrnAUP_66LfaupZr6bLCKwnYocF1ICcAzkcYw7l5jHa4DTc2ZLgLi-yfbv2wGXpybAvLfZcO424TxHOuQykCSvbfPPuf06kkjPbYmMg6_GdM3JcQ_50VUXQFZkjH45BH5zX7y-2u0ReM8zxt65RpJAvlivrc8j2_E-u0LhlzCwEgsnd61lG4baaI86IVl4wNXkMDui4CgGvAUAf4AXW7Imw_cF0zI69z0SLfahjaYkdREGIYKStBtPAR04sfsR7o.LHBODYub4W4Vq-SXfdbk1Q", null: true

      end
    end
  end
end