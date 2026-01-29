import React from 'react';
import { 
  Calendar, 
  Users, 
  MessageSquare, 
  FileText, 
  Star, 
  CreditCard, 
  Bell, 
  Settings, 
  Shield, 
  BarChart3,
  Clock,
  Link,
  CheckCircle,
  ArrowRight,
  Menu,
  X,
  Play,
  Quote,
  TrendingUp,
  Zap,
  Heart,
  Award,
  Phone,
  Mail,
  MapPin,
  ChevronDown,
  ChevronUp
} from 'lucide-react';
import logoImage from './WhatsApp_Image_2025-08-15_at_13.59.22__1_-removebg-preview.png';

function App() {
  const [mobileMenuOpen, setMobileMenuOpen] = React.useState(false);
  const [openFaq, setOpenFaq] = React.useState<number | null>(null);

  const features = [
    {
      icon: BarChart3,
      title: "Panel de control",
      description: "Página principal con métricas clave, próximas citas y accesos rápidos a funciones importantes.",
      color: "#8CA48F"
    },
    {
      icon: Users,
      title: "Perfil Profesional",
      description: "Diseña tu perfil profesional con todo sobre tí.",
      color: "#D58E6E"
    },
    {
      icon: Shield,
      title: "Verificación",
      description: "Acredita tus titulaciones y certificaciones profesionales. Obtendrás un sello de terapeuta verificado.",
      color: "#C9A2A6"
    },
    {
      icon: Settings,
      title: "Servicios",
      description: "Establece tus servicios de forma personalizada. Crea tus packs y gestiona tus ofertas.",
      color: "#A2B2C2"
    },
    {
      icon: Clock,
      title: "Disponibilidad",
      description: "Configura tu agenda, tus horarios, dias libres, franjas disponibles para próximas citas.",
      color: "#8CA48F"
    },
    {
      icon: Calendar,
      title: "Reservas",
      description: "Gestión completa de citas y reservas de tus clientes.",
      color: "#D58E6E"
    },
    {
      icon: Users,
      title: "Clientes",
      description: "Tu base de datos de clientes. Historial y datos de contacto.",
      color: "#C9A2A6"
    },
    {
      icon: MessageSquare,
      title: "Chat",
      description: "Comunícate directamente y de forma segura con tus clientes, sin salir de la plataforma.",
      color: "#A2B2C2"
    },
    {
      icon: FileText,
      title: "Documentos y Materiales",
      description: "Tu biblioteca de recursos que podrás compartir con tus clientes.",
      color: "#8CA48F"
    },
    {
      icon: Star,
      title: "Reseñas",
      description: "Las opiniones y valoraciones de tus clientes. Con posibilidad de interactuar.",
      color: "#D58E6E"
    },
    {
      icon: CreditCard,
      title: "Cobros",
      description: "Registro y control de cobros a clientes. Con opción de plataforma Stripe.",
      color: "#C9A2A6"
    },
    {
      icon: Bell,
      title: "Notificaciones",
      description: "Personalización de las notificaciones que quieras recibir: Citas, mensajes chat, cobros, etc.",
      color: "#A2B2C2"
    },
    {
      icon: Link,
      title: "Integraciones",
      description: "Sincronización con calendarios personales, y más opciones de programación.",
      color: "#8CA48F"
    }
  ];

  const benefits = [
    {
      title: "Gestión completa",
      description: "Tu consulta en orden, tu agenda bajo control, tu energía en lo esencial.",
      icon: CheckCircle
    },
    {
      title: "Comunicación segura",
      description: "Chat integrado y sistema de notificaciones para mantener contacto seguro con tus clientes.",
      icon: MessageSquare
    },
    {
      title: "Cobros automatizados",
      description: "Si lo deseas, sistema de cobros integrado para facilitar su gestión, y asegurarte las reservas.",
      icon: CreditCard
    },
    {
      title: "Profesional verificado",
      description: "Sistema de verificación que aumenta la confianza y credibilidad con tus clientes.",
      icon: Shield
    }
  ];

  const howItWorks = [
    {
      step: "1",
      title: "Regístrate",
      description: "Comenzar es sencillo. Crea tu cuenta en pocos minutos."
    },
    {
      step: "2",
      title: "Configura",
      description: "Define tus servicios, productos, y tu disponibilidad."
    },
    {
      step: "3",
      title: "Conecta",
      description: "Invita a tus clientes a conectar a través de la plataforma."
    },
    {
      step: "4",
      title: "Crece",
      description: "Utiliza Dhara para hacer ahorrar tiempo y hacer crecer tu negocio."
    }
  ];

  const testimonials = [
    {
      name: "María González",
      role: "Terapeuta Holística",
      content: "Dhara ha transformado completamente mi práctica. Ahora puedo dedicar más tiempo a mis pacientes y menos a la administración.",
      rating: 5
    },
    {
      name: "Carlos Mendoza",
      role: "Acupunturista",
      content: "La facilidad de uso y las funciones integradas han hecho que mi trabajo sea mucho más eficiente. Mis clientes también lo aman.",
      rating: 5
    },
    {
      name: "Ana Rodríguez",
      role: "Naturópata",
      content: "El sistema de verificación profesional me ha ayudado a generar más confianza con nuevos pacientes. Excelente plataforma.",
      rating: 5
    }
  ];

  const faqs = [
    {
      question: "¿Qué ventajas tengo con los planes de suscripción en Dhara?",
      answer: "Dhara es la única comunidad enfocada a las terapias naturales. Ganas visibilidad en toda España, simplificas tu gestión administrativa con nuestro software y reduces tiempo en tareas de agenda y cobros para centrarte en lo que amas: tu trabajo terapéutico."
    },
    {
      question: "¿Cómo ayuda Dhara a captar clientes de terapias naturales?",
      answer: "Dhara es la única plataforma dedicada a las terapias naturales y te da visibilidad en un mapa nacional. Conecta tu consulta directamente con personas que buscan terapias naturales en su zona o en formato online. Gracias a nuestro buscador inteligente por ubicación, síntomas o tipo de terapia, tus servicios se muestran a quienes realmente los necesitan y los buscan. Además, tu perfil verificado, con reseñas visibles, genera confianza y multiplica las posibilidades de que nuevos clientes reserven contigo."
    },
    {
      question: "¿Hay comisiones por las reservas de clientes?",
      answer: "No. A diferencia de otras plataformas, Dhara no se queda con un porcentaje de tus ingresos. Tu suscripción cubre lo que tú decides y tus honorarios son íntegramente tuyos."
    },
    {
      question: "¿Qué incluye el plan básico y el avanzado?",
      answer: "El plan básico te da visibilidad en el mapa con un perfil completo. Los planes avanzados añaden un software con herramientas de gestión que facilitan tu día a día."
    },
    {
      question: "¿Por qué nuestro software es la mejor opción para profesionales?",
      answer: "Porque está diseñado para ti, para liberarte de la carga administrativa con herramientas de: agenda digital, reservas automáticas, chat, recordatorios, estadísticas y gestión de pagos en un solo lugar. Con ello, ahorras horas de trabajo y reduce cancelaciones, lo que se traduce en más tiempo para cuidar de tus clientes y de ti."
    },
    {
      question: "¿Si soy un centro con varios profesionales y llevo la gestión, Dhara es para mí?",
      answer: "Sí. Dhara se adapta tanto a profesionales independientes como a centros. Contamos con planes de suscripción diseñados para cubrir ambas necesidades: desde la visibilidad en el mapa y el perfil del centro, hasta la gestión completa con software para todos los profesionales del equipo."
    },
    {
      question: "¿Cómo garantizan la igualdad de visibilidad entre profesionales?",
      answer: "En Dhara no hay favoritismos ni rankings pagados. La visibilidad depende únicamente de la localización y del buscador por necesidades de los clientes."
    },
    {
      question: "¿Puedo tener visibilidad en diferentes ubicaciones si trabajo en varios lugares?",
      answer: "Sí. En tu perfil puedes indicar hasta 4 ubicaciones diferentes donde ofreces tus servicios. Así, quienes busquen terapias en esas zonas podrán encontrarte fácilmente, aumentando tu alcance y tus oportunidades de ser elegido."
    },
    {
      question: "¿Habrá competencia dentro de la plataforma?",
      answer: "En Dhara creemos que hay clientes para todas las personas. Cada terapeuta tiene su manera única de acompañar, y las personas buscan justamente esa conexión especial. La plataforma no fomenta la competencia desleal, sino la visibilidad igualitaria: lo importante es que cada cliente encuentre el acompañamiento que más resuene con su proceso."
    },
    {
      question: "¿Cómo funcionan las reseñas de clientes?",
      answer: "Las reseñas son una herramienta para fortalecer la confianza y dar valor al trabajo de cada terapeuta. Todas las reseñas serán revisadas con rigor para asegurar que cumplen con nuestros valores de respeto, ética y veracidad. De este modo, se protegen tanto clientes como profesionales, garantizando un entorno seguro, humano y honesto. En caso de reiteradas valoraciones negativas por motivos justificados, Dhara se reserva el derecho de actuar para mantener la calidad y el respeto en la comunidad."
    },
    {
      question: "¿Los planes de suscripción tienen permanencia?",
      answer: "No. En Dhara creemos en la libertad y la confianza. Nuestros planes de suscripción no tienen permanencia, puedes darte de baja en cualquier momento si así lo decides. Queremos que te quedes porque la plataforma te aporta valor, no por obligación."
    }
  ];

  const pricingPlans = [
    {
      name: "Plan Básico",
      price: "14,99€",
      period: "/mes",
      description: "Ideal si estás empezando y quieres tener visibilidad.",
      features: [
        "Perfil profesional completo",
        "Visibilidad igual a otros planes"
      ],
      color: "#A2B2C2",
      popular: false
    },
    {
      name: "Plan Avanzado",
      price: "38,99€",
      period: "/mes",
      description: "Ideal para ti si necesitas ahorrar tiempo en la gestión de tu trabajo, dejar de compartir tu teléfono personal, y tener un canal directo y seguro a la vez que gestionas toda tu agenda profesional.",
      features: [
        "Perfil profesional completo",
        "Visibilidad igual a otros planes",
        "Software completo de gestión",
        "Estadísticas",
        "Agenda",
        "Reservas",
        "Citas",
        "Chat",
        "Y mucho más"
      ],
      color: "#8CA48F",
      popular: true
    },
    {
      name: "Plan Avanzado Pro",
      price: "45,99€",
      period: "/mes",
      description: "Ideal para ti si a parte de poder gestionar tu trabajo en una sola plataforma quieres asegurarte que las reservas estén abonadas con antelación. ¡Son todo ventajas!",
      features: [
        "Perfil profesional completo",
        "Visibilidad igual a otros planes",
        "Software completo de gestión",
        "Estadísticas",
        "Agenda",
        "Reservas",
        "Citas",
        "Chat",
        "Y mucho más",
        "Pasarela de pago"
      ],
      color: "#D58E6E",
      popular: false
    },
    {
      name: "Plan Centros",
      price: "Desde 49,99€",
      period: "/mes",
      description: "Si eres un centro con varios profesionales contacta con nosotras para información de los planes adaptados para tu centro.",
      features: [
        "Visibilidad: Desde 49,99€/mes",
        "Visibilidad + Software: Desde 125,99€/mes",
        "Visibilidad + Software + Pasarela: Desde 149,99€/mes",
        "Planes adaptados para centros"
      ],
      color: "#C9A2A6",
      popular: false
    }
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-[#F3EEE9] via-[#F5F1EC] to-[#F8F5F2]" style={{ color: '#2D3A4A' }}>
      {/* Header */}
      <header className="sticky top-0 z-50 backdrop-blur-md bg-white/80 border-b border-stone-200/50">
        <nav className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="flex h-20 items-center justify-between">
            <div className="flex items-center">
              <div className="flex-shrink-0">
                <img src={logoImage} alt="Dhara" className="h-12 w-auto" />
              </div>
            </div>
            
            <div className="hidden md:block">
              <div className="ml-10 flex items-baseline space-x-8">
                <a href="#features" className="text-sm font-medium hover:text-emerald-600 transition-colors duration-200">Características</a>
                <a href="#how-it-works" className="text-sm font-medium hover:text-emerald-600 transition-colors duration-200">Cómo Funciona</a>
                <a href="#benefits" className="text-sm font-medium hover:text-emerald-600 transition-colors duration-200">Beneficios</a>
                <a href="#testimonials" className="text-sm font-medium hover:text-emerald-600 transition-colors duration-200">Testimonios</a>
                <a href="#faq" className="text-sm font-medium hover:text-emerald-600 transition-colors duration-200">FAQ</a>
                <button 
                  className="px-6 py-3 rounded-full text-white font-medium hover:shadow-lg hover:scale-105 transition-all duration-200 shadow-md"
                  style={{ backgroundColor: '#8CA48F' }}
                >
                  Únete Hoy
                </button>
              </div>
            </div>
            
            <div className="md:hidden">
              <button
                onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
                className="p-2 rounded-lg hover:bg-stone-100 transition-colors"
              >
                {mobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
              </button>
            </div>
          </div>
        </nav>

        {/* Mobile menu */}
        {mobileMenuOpen && (
          <div className="md:hidden absolute top-20 left-0 right-0 bg-white/95 backdrop-blur-md shadow-xl border-b border-stone-200 z-50">
            <div className="px-6 py-6 space-y-4">
              <a href="#features" className="block text-sm font-medium hover:text-emerald-600 transition-colors">Características</a>
              <a href="#how-it-works" className="block text-sm font-medium hover:text-emerald-600 transition-colors">Cómo Funciona</a>
              <a href="#benefits" className="block text-sm font-medium hover:text-emerald-600 transition-colors">Beneficios</a>
              <a href="#testimonials" className="block text-sm font-medium hover:text-emerald-600 transition-colors">Testimonios</a>
              <a href="#faq" className="block text-sm font-medium hover:text-emerald-600 transition-colors">FAQ</a>
              <button 
                className="w-full px-6 py-3 rounded-full text-white font-medium hover:shadow-lg transition-all duration-200 shadow-md"
                style={{ backgroundColor: '#8CA48F' }}
              >
                Únete Hoy
              </button>
            </div>
          </div>
        )}
      </header>

      {/* Hero Section */}
      <section className="relative px-6 py-32 sm:py-40 lg:px-8 overflow-hidden">
                 <div className="absolute inset-0 bg-gradient-to-br from-[#F3EEE9]/30 to-[#F8F5F2]/30"></div>
        <div className="relative mx-auto max-w-5xl text-center">

          
          <h1 className="text-5xl font-bold tracking-tight sm:text-7xl mb-8 leading-tight">
            Organiza, crece y conecta con{' '}
            <span className="bg-gradient-to-r from-emerald-600 to-teal-600 bg-clip-text text-transparent">Dhara</span>
          </h1>
          <h2 className="text-2xl font-semibold mb-8 text-stone-600">
            La plataforma de gestión y visibilidad para profesionales.
          </h2>
          <p className="text-xl leading-8 mb-12 text-stone-600 max-w-4xl mx-auto">
            Gestiona todo tu negocio desde una sola plataforma. Agenda y citas, clientes, pagos y documentos. 
            Dhara simplifica tu día a día para que te concentres en lo que más importa: Tu tiempo.
          </p>
          <div className="flex flex-col sm:flex-row gap-6 justify-center items-center">
                            <button 
                  className="px-10 py-5 rounded-full text-white font-semibold text-lg hover:shadow-xl hover:scale-105 transition-all duration-300 flex items-center justify-center gap-3 shadow-lg btn-primary"
                  style={{ backgroundColor: '#8CA48F' }}
                >
              Únete Hoy
              <ArrowRight size={20} />
            </button>
            <button 
              className="px-10 py-5 rounded-full font-semibold text-lg border-2 hover:bg-stone-50 transition-all duration-300 flex items-center justify-center gap-3 group"
              style={{ borderColor: '#A2B2C2', color: '#2D3A4A' }}
            >
              <Play size={20} className="group-hover:scale-110 transition-transform" />
              Ver Demo
            </button>
          </div>
        </div>
      </section>

      {/* How It Works Section */}
      <section id="how-it-works" className="py-32 px-6 lg:px-8 bg-white">
        <div className="mx-auto max-w-7xl">
          <div className="text-center mb-20">
            <h3 className="text-4xl font-bold mb-6">Comenzar es sencillo</h3>
            <p className="text-xl text-stone-600 max-w-3xl mx-auto leading-relaxed">
              En sólo 4 pasos, tendrás lista tu herramienta de trabajo digitalizada.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12">
            {howItWorks.map((step, index) => (
              <div key={index} className="text-center group">
                <div className="relative mb-8">
                  <div 
                    className="w-20 h-20 rounded-full flex items-center justify-center mx-auto text-2xl font-bold text-white shadow-lg group-hover:scale-110 transition-all duration-300"
                    style={{ backgroundColor: '#8CA48F' }}
                  >
                    {step.step}
                  </div>
                  {index < howItWorks.length - 1 && (
                    <div className="hidden lg:block absolute top-10 left-full w-full h-0.5 bg-gradient-to-r from-emerald-200 to-transparent transform translate-x-4"></div>
                  )}
                </div>
                <h4 className="text-2xl font-semibold mb-4">{step.title}</h4>
                <p className="text-stone-600 leading-relaxed">{step.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Features Section */}
             <section id="features" className="py-32 px-6 lg:px-8 bg-gradient-to-br from-[#F3EEE9] to-white">
        <div className="mx-auto max-w-7xl">
          <div className="text-center mb-20">
            <h3 className="text-4xl font-bold mb-6">Mejora tu negocio de terapias naturales</h3>
            <p className="text-xl text-stone-600 max-w-4xl mx-auto leading-relaxed">
              Todo lo que necesitas: tiempo y visibilidad. Simplifica tu gestión y tu negocio desde una sola plataforma. 
              Con todas las herramientas que necesitas para optimizar tu tiempo.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {features.map((feature, index) => {
              const Icon = feature.icon;
              return (
                <div 
                  key={index} 
                  className="p-8 rounded-2xl shadow-sm hover:shadow-xl transition-all duration-300 hover:-translate-y-2 bg-white border border-stone-100 group card-hover"
                >
                  <div 
                    className="w-16 h-16 rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300"
                    style={{ backgroundColor: `${feature.color}15` }}
                  >
                    <Icon size={28} style={{ color: feature.color }} />
                  </div>
                  <h4 className="text-xl font-semibold mb-4">{feature.title}</h4>
                  <p className="text-stone-600 leading-relaxed">{feature.description}</p>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* Benefits Section */}
      <section id="benefits" className="py-32 px-6 lg:px-8 bg-white">
        <div className="mx-auto max-w-7xl">
          <div className="text-center mb-20">
            <h3 className="text-4xl font-bold mb-6">¿Por qué elegir Dhara?</h3>
            <p className="text-xl text-stone-600 max-w-4xl mx-auto leading-relaxed">
              Tu consulta visible, tu agenda organizada, tu tiempo de vuelta. 
              Dhara es la plataforma que multiplica tu visibilidad y te libera del peso de la gestión.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {benefits.map((benefit, index) => {
              const Icon = benefit.icon;
              return (
                <div key={index} className="text-center group">
                  <div 
                    className="w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6 group-hover:scale-110 transition-transform duration-300 shadow-lg"
                    style={{ backgroundColor: '#8CA48F' }}
                  >
                    <Icon size={32} color="white" />
                  </div>
                  <h4 className="text-xl font-semibold mb-4">{benefit.title}</h4>
                  <p className="text-stone-600 leading-relaxed">{benefit.description}</p>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* Testimonials Section */}
             <section id="testimonials" className="py-32 px-6 lg:px-8 bg-gradient-to-br from-[#F3EEE9] to-white">
        <div className="mx-auto max-w-7xl">
          <div className="text-center mb-20">
            <h3 className="text-4xl font-bold mb-6">Lo que dicen de Dhara</h3>
            <p className="text-xl text-stone-600 max-w-3xl mx-auto leading-relaxed">
              profesionales de toda España confían en Dhara para gestionar su negocio.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {testimonials.map((testimonial, index) => (
              <div 
                key={index} 
                className="p-8 rounded-2xl shadow-sm bg-white border border-stone-100 hover:shadow-lg transition-all duration-300 card-hover"
              >
                <div className="flex items-center mb-6">
                  <Quote size={24} style={{ color: '#8CA48F' }} className="mr-3" />
                  <div className="flex">
                    {[...Array(testimonial.rating)].map((_, i) => (
                      <Star key={i} size={18} fill="#8CA48F" color="#8CA48F" />
                    ))}
                  </div>
                </div>
                <p className="mb-6 leading-relaxed text-stone-600 italic">"{testimonial.content}"</p>
                <div>
                  <div className="font-semibold text-lg">{testimonial.name}</div>
                  <div className="text-sm text-stone-500">{testimonial.role}</div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Pricing Section */}
      <section id="pricing" className="py-32 px-6 lg:px-8 bg-white">
        <div className="mx-auto max-w-7xl">
          <div className="text-center mb-20">
            <h3 className="text-4xl font-bold mb-6">Planes que se adaptan a ti</h3>
            <p className="text-xl text-stone-600 max-w-3xl mx-auto leading-relaxed">
              Elige el plan perfecto para tu práctica. Todos sin permanencia.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {pricingPlans.map((plan, index) => (
              <div 
                key={index} 
                className={`p-8 rounded-2xl shadow-sm bg-white border relative hover:shadow-xl transition-all duration-300 ${plan.popular ? 'ring-2 ring-emerald-200 border-emerald-200 scale-105' : 'border-stone-200'}`}
              >
                {plan.popular && (
                  <div 
                    className="absolute -top-4 left-1/2 transform -translate-x-1/2 px-6 py-2 rounded-full text-sm font-semibold text-white shadow-lg"
                    style={{ backgroundColor: '#8CA48F' }}
                  >
                    Más Popular
                  </div>
                )}
                
                <div className="text-center mb-8">
                  <h4 className="text-2xl font-bold mb-4">{plan.name}</h4>
                  <div className="flex items-baseline justify-center mb-4">
                    <span className="text-4xl font-bold" style={{ color: plan.color }}>
                      {plan.price}
                    </span>
                    <span className="text-lg text-stone-500 ml-1">{plan.period}</span>
                  </div>
                  <p className="text-stone-600 text-sm leading-relaxed">{plan.description}</p>
                </div>
                
                <ul className="space-y-4 mb-8">
                  {plan.features.map((feature, featureIndex) => (
                    <li key={featureIndex} className="flex items-start">
                      <CheckCircle size={18} style={{ color: plan.color }} className="mr-3 flex-shrink-0 mt-0.5" />
                      <span className="text-sm text-stone-600">{feature}</span>
                    </li>
                  ))}
                </ul>
                
                <button 
                  className={`w-full py-4 rounded-full font-semibold transition-all duration-300 hover:scale-105 ${plan.popular ? 'text-white shadow-lg' : 'border-2'}`}
                  style={plan.popular 
                    ? { backgroundColor: plan.color } 
                    : { borderColor: plan.color, color: plan.color }
                  }
                >
                  {plan.name === 'Plan Centros' ? 'Contactar' : 'Elegir Plan'}
                </button>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* FAQ Section */}
             <section id="faq" className="py-32 px-6 lg:px-8 bg-gradient-to-br from-[#F3EEE9] to-white">
        <div className="mx-auto max-w-4xl">
          <div className="text-center mb-20">
            <h3 className="text-4xl font-bold mb-6">Preguntas Frecuentes</h3>
            <p className="text-xl text-stone-600">
              Resolvemos las dudas más comunes sobre Dhara
            </p>
          </div>
          
          <div className="space-y-4">
            {faqs.map((faq, index) => (
              <div key={index} className="border border-stone-200 rounded-2xl overflow-hidden bg-white shadow-sm hover:shadow-md transition-all duration-300">
                <button
                  className="w-full px-8 py-6 text-left flex items-center justify-between hover:bg-stone-50 transition-colors"
                  onClick={() => setOpenFaq(openFaq === index ? null : index)}
                >
                  <span className="font-semibold text-lg">{faq.question}</span>
                  {openFaq === index ? (
                    <ChevronUp size={24} style={{ color: '#8CA48F' }} />
                  ) : (
                    <ChevronDown size={24} style={{ color: '#8CA48F' }} />
                  )}
                </button>
                {openFaq === index && (
                  <div className="px-8 pb-6">
                    <p className="text-stone-600 leading-relaxed">{faq.answer}</p>
                  </div>
                )}
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Closing CTA Section */}
             <section className="py-32 px-6 lg:px-8 bg-gradient-to-br from-[#F3EEE9] to-[#F8F5F2]">
        <div className="mx-auto max-w-5xl text-center">
          <h3 className="text-4xl font-bold mb-8">
            Dhara es el impulso que estabas esperando. Únete hoy.
          </h3>
          <div className="text-lg text-stone-600 mb-12 max-w-4xl mx-auto space-y-6 leading-relaxed">
            <p>
              Sabemos que el mayor reto de quienes trabajan en las terapias naturales no es solo dar lo mejor de sí en cada sesión, 
              sino ser reconocidos, valorados y encontrados por las personas que realmente necesitan lo que ofrecen.
            </p>
            <p>
              Dhara nace para cambiar eso: aquí tu talento tiene un espacio propio, sin comisiones injustas ni favoritismos.
            </p>
            <p>
              Con tu perfil en Dhara, podrás mostrar quién eres, qué haces y cómo transformas vidas. Estarás en un lugar donde las personas 
              buscan activamente bienestar natural, listas para encontrarte, reservar contigo y recomendarte.
            </p>
            <p>
              No tienes que luchar más contra la invisibilidad ni perder horas en gestiones.
            </p>
            <p className="font-semibold text-xl">
              Únete hoy y da el paso hacia una comunidad que reconoce tu valor y te conecta con quienes esperan tu ayuda.
            </p>
          </div>
          
          <div className="flex flex-col sm:flex-row gap-6 justify-center items-center">
            <button 
              className="px-12 py-5 rounded-full text-white font-semibold text-lg hover:shadow-xl hover:scale-105 transition-all duration-300 flex items-center gap-3 shadow-lg btn-primary"
              style={{ backgroundColor: '#8CA48F' }}
            >
              Únete a Dhara Hoy
              <ArrowRight size={20} />
            </button>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-20 px-6 lg:px-8 border-t border-stone-200 bg-white">
        <div className="mx-auto max-w-7xl">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-12 mb-16">
            <div className="md:col-span-2">
              <h4 className="text-3xl font-bold mb-6" style={{ color: '#8CA48F' }}>Dhara</h4>
              <p className="text-stone-600 leading-relaxed mb-8 max-w-md">
                Dhara es la plataforma líder que conecta personas con profesionales certificados. Tu bienestar es nuestra prioridad.
              </p>
              <div className="space-y-3">
                <div className="flex items-center text-stone-600">
                  <Mail size={18} className="mr-3" />
                  contacto@dhara.es
                </div>
                <div className="flex items-center text-stone-600">
                  <Phone size={18} className="mr-3" />
                  +34 900 123 456
                </div>
              </div>
            </div>
            
            <div>
              <h5 className="font-semibold text-lg mb-6">Plataforma</h5>
              <ul className="space-y-3 text-stone-600">
                <li><a href="#" className="hover:text-emerald-600 transition-colors">Características</a></li>
                <li><a href="#" className="hover:text-emerald-600 transition-colors">Precios</a></li>
                <li><a href="#" className="hover:text-emerald-600 transition-colors">Seguridad</a></li>
                <li><a href="#" className="hover:text-emerald-600 transition-colors">Integraciones</a></li>
              </ul>
            </div>
            
            <div>
              <h5 className="font-semibold text-lg mb-6">Soporte</h5>
              <ul className="space-y-3 text-stone-600">
                <li><a href="#" className="hover:text-emerald-600 transition-colors">Centro de Ayuda</a></li>
                <li><a href="#" className="hover:text-emerald-600 transition-colors">Contacto</a></li>
                <li><a href="#" className="hover:text-emerald-600 transition-colors">Términos de Uso</a></li>
                <li><a href="#" className="hover:text-emerald-600 transition-colors">Privacidad</a></li>
              </ul>
            </div>
          </div>
          
          <div className="pt-8 border-t border-stone-200 flex flex-col md:flex-row justify-between items-center">
            <div className="text-stone-500 mb-4 md:mb-0">
              © 2024 Dhara. Todos los derechos reservados.
            </div>
            <div className="flex items-center space-x-2 text-stone-500">
              <span>Hecho con</span>
              <Heart size={18} style={{ color: '#8CA48F' }} />
              <span>para profesionales</span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}

export default App;