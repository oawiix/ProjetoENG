<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <style>
        .landing-page { background-color: #f0f0f0; display: flex; flex-direction: column; overflow: hidden; }
        .nav-container { padding: 80px; background-color: #f0f0f0; display: flex; width: 90%; gap: 20px; overflow: hidden; color: #000; flex-wrap: wrap; justify-content: space-between;  font: 500 20px Inter, sans-serif; }
        @media (max-width: 991px) { .nav-container { max-width: 100%;  } }
        .site-name { margin: auto 0; }
        .nav-items { display: flex; align-items: center; gap: 40px 48px; white-space: nowrap; justify-content: end; }
        @media (max-width: 991px) { .nav-items { white-space: initial; } }
        .nav-link { align-self: stretch; margin: auto 0; }
        .cta-button { align-self: stretch; border-radius: 8px; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); background-color: #000; color: #fff; font-size: 18px;padding: 12px 30px 12px; font-weight: 600; }
        @media (max-width: 991px) { .cta-button { white-space: initial; } }
        .main-content { display: flex; margin-top: 48px; width: 100%; padding-left: 0px; flex-direction: column; align-items: center; }
        @media (max-width: 991px) { .main-content { max-width: 100%; padding-left: 0px; margin-top: 40px; } }
        .hero-content { display: flex; width:90%; max-width: 100%; flex-direction: column; font-family: Inter, sans-serif; justify-content: start; }
        .hero-title-wrapper { display: flex; width: 100%; flex-direction: column; justify-content: start; align-items: center; }
        @media (max-width: 991px) { .hero-title-wrapper { max-width: 100%; } }
        .hero-title { color: #000; font-size: 64px; font-weight: 700; letter-spacing: -1.28px; }
        @media (max-width: 991px) { .hero-title { max-width: 100%; font-size: 40px; } }
        .hero-subtitle { color: rgba(0, 0, 0, 0.75); font-size: 24px; font-weight: 400; line-height: 36px; margin-top: 24px; align-items: center; }
        @media (max-width: 991px) { .hero-subtitle { max-width: 100%; } }
        .hero-cta { align-self: center; border-radius: 8px; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); background-color: #000; margin-top: 40px; font-size: 24px; color: #fff; font-weight: 600; white-space: nowrap; padding: 12px 30px 12px; }
        @media (max-width: 991px) { .hero-cta { white-space: initial;  } }
        .hero-image { aspect-ratio: 2; object-fit: contain; object-position: center; width: 100%; border-radius: 8px; margin-top: 80px; max-width: 1280px; }
        @media (max-width: 991px) { .hero-image { max-width: 100%; margin-top: 40px; } }
        .section-heading { color: #000; letter-spacing: -0.96px; margin-top: 150px; font: 600 48px Inter, sans-serif;align-self: center; padding: 50px; }
        @media (max-width: 991px) { .section-heading { margin-top: 40px; font-size: 40px; } }
        .card-container { display: flex; margin-top: 0px; align-items: center; gap: 100px; justify-content: center; flex-wrap: wrap; font: 24px Inter, sans-serif;   }
        @media (max-width: 991px) { .card-container { margin-top: 40px; } }
        .feature-card { align-self: stretch; display: flex; min-width: 240px; flex-direction: column; justify-content: start; flex: 1; flex-basis: 0%; margin: auto 0; }
        .card-image { aspect-ratio: 1; object-fit: contain; object-position: center; width: 100%; border-radius: 8px; }
        .card-content { display: flex; margin-top: 24px; width: 381px; max-width: 100%; flex-direction: column; justify-content: center; }
        .card-title { color: #000; font-weight: 500; }
        .card-description { color: #828282; font-weight: 400; line-height: 36px; margin-top: 0px; }
        .split-section { align-self: stretch; margin-top: 0px; }


        @media (max-width: 991px) { .split-section { max-width: 100%; margin-top: 40px; } }
        .split-container { gap: 20px; display: flex; margin-left: 100px; }
        @media (max-width: 991px) { .split-container { flex-direction: column; align-items: stretch; gap: 0; } }
        .split-content { display: flex; flex-direction: column; line-height: normal; width: 100%;  }
        @media (max-width: 991px) { .split-content { width: 100%; } }
        .split-text { display: flex; width: 100%; flex-direction: column; align-items: start; font: 24px Inter, sans-serif; }
        @media (max-width: 991px) { .split-text { max-width: 100%; margin-top: 40px; } }
        .split-heading { color: #000; font-size: 48px; font-weight: 600; letter-spacing: -0.96px; }
        @media (max-width: 991px) { .split-heading { font-size: 40px; } }
        .split-details { align-self: stretch; display: flex; margin-top: 8px; flex-direction: column; justify-content: start; }
        @media (max-width: 991px) { .split-details { max-width: 100%; margin-top: 40px; } }
        .detail-item { display: flex; width: 100%; flex-direction: column; justify-content: center; }
        @media (max-width: 991px) { .detail-item { max-width: 100%; } }
        .detail-title { color: #000; font-weight: 500; }
        @media (max-width: 991px) { .detail-title { max-width: 100%; } }
        .detail-description { color: #828282; font-weight: 400; line-height: 36px; margin-top: 8px; }
        @media (max-width: 991px) { .detail-description { max-width: 100%; } }
        .split-buttons { display: flex; margin-top: 47px; align-items: center; gap: 16px; font-weight: 500; justify-content: start; }
        @media (max-width: 991px) { .split-buttons { margin-top: 40px; } }
        .primary-button { align-self: stretch; border-radius: 8px; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); background-color: #000; color: #fff;  white-space: nowrap; }
        @media (max-width: 991px) { .primary-button { white-space: initial; } }
        .secondary-button { align-self: stretch; border-radius: 8px; background-color: #e6e6e6; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); min-width: 240px; color: #000; }
        @media (max-width: 991px) { .secondary-button { padding: 0 20px; } }
        .split-image { display: flex; flex-direction: column; line-height: normal; width: 58%;  }
        @media (max-width: 991px) { .split-image { width: 100%; } }
        .feature-image {  object-fit: contain; object-position: center; width: 100%; border-radius: 8px 0 0 8px; margin-top: 200px; }
        @media (max-width: 991px) { .feature-image { max-width: 100%; margin-top: 40px; } }
        .testimonial-section { color: #000; letter-spacing: -0.96px; margin-top: 0px; font: 600 48px Inter, sans-serif; }
        @media (max-width: 991px) { .testimonial-section { margin-top: 40px; font-size: 40px; } }
        .testimonial-container { display: flex; margin-top: 0px; align-items: center; gap: 31px; justify-content: start; flex-wrap: wrap; font: 24px Inter, sans-serif; }
        @media (max-width: 991px) { .testimonial-container { margin-top: 40px; } }
        .testimonial-card { align-self: stretch; display: flex; min-width: 240px; flex-direction: column; overflow: hidden; justify-content: start; flex: 1; flex-basis: 0%; margin: auto 0; }
        @media (max-width: 991px) { .testimonial-card { max-width: 100%; } }
        .testimonial-image { aspect-ratio: 1.83; object-fit: contain; object-position: center; width: 100%; border-radius: 0px; }
        @media (max-width: 991px) { .testimonial-image { max-width: 100%; } }
        .testimonial-content { display: flex; margin-top: 0px; width: 548px; max-width: 100%; flex-direction: column; justify-content: start; }
        .profile { display: flex; margin-top: 0px; width: 548px; max-width: 100%; flex-direction: row; justify-content: start; }
        
        .testimonial-title { color: #000; font-weight: 500;margin-top: 20px; }
        @media (max-width: 991px) { .testimonial-title { max-width: 100%; } }
        .testimonial-text { color: #828282; font-weight: 200; line-height: 36px; margin-top: 0px; font-size: 18px; }
        @media (max-width: 991px) { .testimonial-text { max-width: 100%; } }



        .quote-section { background-color: #f7f7f7; display: flex; margin-top: 150px; width: 100%; gap: 20px; overflow: hidden; font-family: Inter, sans-serif; flex-wrap: wrap; justify-content: space-between; padding: 60px 2px 60px; }
        @media (max-width: 991px) { .quote-section { max-width: 100%; margin-top: 40px; padding: 0 20px; } }
        


        
        .quote-heading { color: #000; font-size: 48px; font-weight: 600; letter-spacing: -0.96px; margin: auto 0; margin-left:50px; }
        @media (max-width: 991px) { .quote-heading { font-size: 40px; } }
        .quote-buttons { display: flex; align-items: center; gap: 24px; font-size: 24px; font-weight: 500; justify-content: end; }
        
        @media (max-width: 991px) { .quote-buttons { max-width: 100%; } }
        .quote-primary-button { align-self: stretch; border-radius: 8px; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); background-color: #000; color: #fff;  white-space: nowrap; }
        @media (max-width: 991px) { .quote-primary-button { white-space: initial; padding: 0 20px; } }
        .quote-secondary-button { align-self: stretch; border-radius: 8px; background-color: #e6e6e6; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); min-width: 240px; color: rgba(0, 0, 0, 0.9); padding: 20px 32px; }
        @media (max-width: 991px) { .quote-secondary-button { padding: 0 20px; } }
        
        
        .footer { background-color: #fff; display: flex; width: 100%; flex-direction: column; overflow: hidden;  }
        @media (max-width: 991px) { .footer { max-width: 100%; padding: 0 20px; } }
        .footer-divider { height: 1px; border: 1px solid #e6e6e6; }
        @media (max-width: 991px) { .footer-divider { max-width: 100%; } }
        .footer-content { display: flex; margin-top: 0px; width: 100%; gap: 40px 100px; flex-wrap: wrap; }
        @media (max-width: 991px) { .footer-content { max-width: 100%; margin-top: 40px; } }
        .footer-info { align-self: start; display: flex; margin-top: 0px; flex-direction: column; }
        .footer-site-name { color: #000; align-self: start; font: 300 15px Inter, sans-serif; padding: 10px 20px 10px; }
        .social-icons { display: flex; margin-top: 5px; gap: 8px; justify-content: end; margin-left: 991px; }
        @media (max-width: 991px) { .social-icons { margin-top: 40px; margin-left:0px } }
        .social-icon { aspect-ratio: 1; object-fit: contain; object-position: center; width: 40px; border-radius: 4px; }
        .footer-links { flex-grow: 1; flex-basis: auto; }
        @media (max-width: 991px) { .footer-links { max-width: 100%; } }
        .footer-columns { gap: 20px; display: flex; }
        @media (max-width: 991px) { .footer-columns { flex-direction: column; align-items: stretch; gap: 0; } }
        .footer-column { display: flex; flex-direction: column; line-height: normal; width: 33%; margin-left: 0; }
        @media (max-width: 991px) { .footer-column { width: 100%; } }
        .footer-link-group { display: flex; flex-grow: 1; flex-direction: column; color: #454545; white-space: nowrap; justify-content: center; font: 500 16px Inter, sans-serif; }
        @media (max-width: 991px) { .footer-link-group { margin-top: 31px; white-space: initial; } }
        .footer-topic { color: #000; }
        .footer-link { margin-top: 24px; }
        .visually-hidden {
          position: absolute;
          width: 1px;
          height: 1px;
          margin: -1px;
          padding: 0;
          overflow: hidden;
          clip: rect(0, 0, 0, 0);
          white-space: nowrap;
          border: 0;
        }
        .navlinks { color: #000;
        text-decoration: none; }	
        </style>
        <div class="landing-page">
        <header class="nav-container">
          
          <div class="site-name">
            <a href="index.jsp" style="text-decoration: none; color:black">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-wrench-adjustable-circle-fill" viewBox="0 0 16 16">
              <path d="M6.705 8.139a.25.25 0 0 0-.288-.376l-1.5.5.159.474.808-.27-.595.894a.25.25 0 0 0 .287.376l.808-.27-.595.894a.25.25 0 0 0 .287.376l1.5-.5-.159-.474-.808.27.596-.894a.25.25 0 0 0-.288-.376l-.808.27z"/>
              <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m-6.202-4.751 1.988-1.657a4.5 4.5 0 0 1 7.537-4.623L7.497 6.5l1 2.5 1.333 3.11c-.56.251-1.18.39-1.833.39a4.5 4.5 0 0 1-1.592-.29L4.747 14.2a7.03 7.03 0 0 1-2.949-2.951M12.496 8a4.5 4.5 0 0 1-1.703 3.526L9.497 8.5l2.959-1.11q.04.3.04.61"/>
            </svg>
            <span style="font-weight: 700;"><i>Projeto ENG</i></span></a>
          </div>
          <nav class="nav-items">
            <a href="about.jsp" class="navlinks">Sobre</a>
            <button class="cta-button" onclick="window.location.href='login.jsp'">Entrar</button>
          </nav>
        </header>
        
        <main class="main-content">
        
        
          <section class="split-section">
            <div class="split-container">
              <div class="split-content">
                <div class="split-text">
                  <h2 class="split-heading">Sobre nos</h2>
                  <div class="split-details">
                    <div class="detail-item">
                      <p class="detail-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Nulla scelerisque arcu quis velit pharetra, vel maximus leo rutrum. 
                         Nunc euismod vestibulum nunc, nec porta eros pretium ultricies.
                          Ut pulvinar vehicula convallis. Aenean ut elit purus.
                           Proin eget nisi et libero finibus ultrices eget non lorem.</p>
                    </div>
                  </div>
                  <div class="split-buttons">

                  </div>
                </div>
              </div>
              <div class="split-image">
               </div>
            </div>
            
          </section>
        
          <!--
          <h2 class="testimonial-section">Section heading</h2>
        
          <div class="testimonial-container">
            <article class="testimonial-card">
              <img width="300px" height="300px" src="https://cdn.builder.io/api/v1/image/assets/TEMP/0455108c8ae7d8a3bd7c359de39d4596db35e0045711523a20a733238f68e557?placeholderIfAbsent=true&apiKey=9f1206a5b5274f348884f89b362ac322" alt="Testimonial 1" class="testimonial-image" loading="lazy">
              <div class="testimonial-content">
                <h3 class="testimonial-title">Subheading</h3>
                <p class="testimonial-text">Body text for whatever you'd like to add more to the subheading.</p>
              </div>
            </article>
            <article class="testimonial-card">
              <img width="300px" height="300px" src="https://cdn.builder.io/api/v1/image/assets/TEMP/8b831550a433f4b16a4fcb646e74b30d8dc85828b90f7121e4b5a892df13dee2?placeholderIfAbsent=true&apiKey=9f1206a5b5274f348884f89b362ac322" alt="Testimonial 2" class="testimonial-image" loading="lazy">
              <div class="testimonial-content">
                <h3 class="testimonial-title">Subheading</h3>
                <p class="testimonial-text">Body text for whatever you'd like to expand on the main point.</p>
              </div>
            </article>
          </div>
        -->
          <h2 class="section-heading">Nossa Equipe</h2> 
        
          <div class="testimonial-container">
            <!--
            <blockquote class="testimonial-card">
              <p class="testimonial-text"> </p>
              <footer class="avatar">
                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/67dbc2b3abd7ba2b199257ad113004315a8d161da7cdf226d0fb43b4dc0bf8b1?placeholderIfAbsent=true&apiKey=9f1206a5b5274f348884f89b362ac322" alt="Avatar" class="social-icon" loading="lazy">
                <div>
                  <cite class="testimonial-title">Name</cite>
                  <p class="testimonial-text">Description</p>
                </div>
              </footer>
            </blockquote>-->

            <blockquote class="testimonial-card">
              <p class="testimonial-text"> </p>
              <footer class="avatar">
                <div>
                  <div class="profile">
                  <img style="border-radius: 8px; margin-right: 25px;" height="100" width="100" src="https://avatars.githubusercontent.com/u/161090760?v=4" alt="Avatar" loading="lazy">
                
                  <cite class="testimonial-title">Felipe Fernandes
                    <p class="testimonial-text">Estudante</p>
                  </cite>
                  
                  </div>
                </div>
              </footer>
            </blockquote>
            <!--
            <blockquote class="testimonial-card">
              <p class="testimonial-text"> </p>
              <footer class="avatar">
                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/4c66068ef92b4fdd40a8e0fc3a46be91247e6d5cb78c14c8850ce0914dbdef55?placeholderIfAbsent=true&apiKey=9f1206a5b5274f348884f89b362ac322" alt="Avatar" class="social-icon" loading="lazy">
                <div>
                  <cite class="testimonial-title">Name</cite>
                  <p class="testimonial-text">Description</p>
                </div>
              </footer>
            </blockquote>-->
          </div>
        </main>
        
        <section class="quote-section">
          <h2 class="quote-heading">Nos acompanhe</h2>
          <div class="social-icons">
            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/199c9a3c64fa87237dabe74b1aff1fe617935141f37a07ba364b7012e90e628c?placeholderIfAbsent=true&apiKey=9f1206a5b5274f348884f89b362ac322" alt="Social icon" class="social-icon" loading="lazy">
            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/b1bac3668b19309ab1c82835d154f9962b24bad9c262723d53374e3173c3e762?placeholderIfAbsent=true&apiKey=9f1206a5b5274f348884f89b362ac322" alt="Social icon" class="social-icon" loading="lazy">
            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/c9c8d64becb556072cf4288b2dadd32d18a3ce8e19d5cc15f298f66d1125313b?placeholderIfAbsent=true&apiKey=9f1206a5b5274f348884f89b362ac322" alt="Social icon" class="social-icon" loading="lazy">
            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0828515f09127d365461d17e1036e88788811bd5c0258116139d171a870fbe56?placeholderIfAbsent=true&apiKey=9f1206a5b5274f348884f89b362ac322" alt="Social icon" class="social-icon" loading="lazy">
          </div>

          <div class="quote-buttons">
          </div>

        </section>
        
        <footer class="footer">
          <hr class="footer-divider">
          <div class="footer-content">
            <div class="footer-info">
              <h1 class="footer-site-name">Projeto Engenharia de Software | Felipe Fernandes</h1>
            </div>
            <!-- <nav class="footer-links">
              <div class="footer-columns">
                <div class="footer-column">
                  <div class="footer-link-group">
                    <h3 class="footer-topic">Topic</h3>
                    <a href="#" class="footer-link">Page</a>
                    <a href="#" class="footer-link">Page</a>
                    <a href="#" class="footer-link">Page</a>
                  </div>
                </div>
                <div class="footer-column">
                  <div class="footer-link-group">
                    <h3 class="footer-topic">Topic</h3>
                    <a href="#" class="footer-link">Page</a>
                    <a href="#" class="footer-link">Page</a>
                    <a href="#" class="footer-link">Page</a>
                  </div>
                </div>
                <div class="footer-column">
                  <div class="footer-link-group">
                    <h3 class="footer-topic">Topic</h3>
                    <a href="#" class="footer-link">Page</a>
                    <a href="#" class="footer-link">Page</a>
                    <a href="#" class="footer-link">Page</a>
                  </div>
                </div>
              </div>
            </nav> -->
          </div>
        </footer>
      </div>
</body>
</html>