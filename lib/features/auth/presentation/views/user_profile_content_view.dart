import 'package:flutter/material.dart';
import '../controllers/user_profile_controller.dart';
import '../theme/user_profile_styles.dart';
import '../widgets/user_profile_widgets.dart';
import '../widgets/user_profile_footer.dart';

class UserProfileContentView extends StatelessWidget {
  final UserProfileController controller;

  const UserProfileContentView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado de Perfil y Foto
          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 110,
                      height: 140,
                      decoration: BoxDecoration(
                        color: UserProfileStyles.osnocBlue,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: UserProfileStyles.osnocBlue.withValues(alpha: 0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: UserProfileStyles.osnocLightBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  controller.fullName,
                  style: UserProfileStyles.headerNameStyle,
                ),
                const Text(
                  "marianitacero.1913@gmail.com",
                  style: UserProfileStyles.headerEmailStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Tarjeta 1: Información Personal
          SectionCard(
            title: "Información Personal",
            icon: Icons.person_outline,
            headerColor: UserProfileStyles.osnocBlue,
            children: [
              Row(
                children: [
                  Expanded(child: ReadonlyField(label: "Nombres", value: controller.firstName)),
                  const SizedBox(width: 12),
                  Expanded(child: ReadonlyField(label: "Apellidos", value: controller.lastName)),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ReadonlyField(
                      label: "Tipo de documento",
                      value: "Cédula de Ciudadanía",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ReadonlyField(
                      label: "N° documento",
                      value: "1098071703",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const ReadonlyField(
                label: "Email / Correo electrónico",
                value: "marianitacero.1913@gmail.com",
              ),
              const SizedBox(height: 12),
              const ReadonlyField(
                label: "Celular",
                value: "315-6757083",
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Tarjeta 2: Roles Asignados
          const SectionCard(
            title: "Rol(es) Asignados",
            icon: Icons.verified_user_outlined,
            headerColor: UserProfileStyles.osnocBlue,
            children: [
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  RoleChip(label: "Geo-divulgador"),
                  RoleChip(label: "Gestor de contenido sitio"),
                  RoleChip(label: "Gestor de estaciones sísmicas"),
                  RoleChip(label: "Gestor de redes sociales"),
                  RoleChip(label: "Log de eventos"),
                  RoleChip(label: "Publicador de noticias"),
                  RoleChip(label: "Publicador de proyectos"),
                  RoleChip(label: "Publicador reportes sísmicos"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Tarjeta 3: Ubicación
          SectionCard(
            title: "Ubicación",
            icon: Icons.location_on_outlined,
            headerColor: UserProfileStyles.osnocBlue,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final bool isNarrow = constraints.maxWidth < 340;
                  if (isNarrow) {
                    return const Column(
                      children: [
                        ReadonlyField(label: "País", value: "COLOMBIA"),
                        SizedBox(height: 8),
                        ReadonlyField(label: "Departamento", value: "Santander"),
                        SizedBox(height: 8),
                        ReadonlyField(label: "Ciudad", value: "BUCARAMANGA"),
                      ],
                    );
                  }
                  return const Row(
                    children: [
                      Expanded(flex: 3, child: ReadonlyField(label: "País", value: "COLOMBIA")),
                      SizedBox(width: 6),
                      Expanded(flex: 4, child: ReadonlyField(label: "Departamento", value: "Santander")),
                      SizedBox(width: 6),
                      Expanded(flex: 5, child: ReadonlyField(label: "Ciudad", value: "BUCARAMANGA")),
                    ],
                  );
                },
              ),
              const SizedBox(height: 12),
              const ReadonlyField(label: "Dirección", value: "Direccion XYZ"),
            ],
          ),
          const SizedBox(height: 16),

          // Tarjeta 4: Estado de la Cuenta
          SectionCard(
            title: "Estado de la cuenta",
            icon: Icons.settings_outlined,
            headerColor: UserProfileStyles.osnocBlue,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Cambiar contraseña",
                    style: TextStyle(fontSize: 13, color: UserProfileStyles.darkText),
                  ),
                  Checkbox(
                    value: false,
                    onChanged: (v) {},
                    activeColor: UserProfileStyles.osnocLightBlue,
                  ),
                ],
              ),
              const Divider(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Estado del Usuario",
                    style: TextStyle(fontSize: 13, color: UserProfileStyles.darkText),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: UserProfileStyles.osnocBgBlue,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: UserProfileStyles.osnocLightBlue.withValues(alpha: 0.5),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 12,
                          color: UserProfileStyles.osnocLightBlue,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Activo",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: UserProfileStyles.osnocBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Botón Editar Perfil
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, size: 18, color: Colors.white),
              label: const Text(
                "EDITAR PERFIL",
                style: UserProfileStyles.editButtonStyle,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: UserProfileStyles.osnocBlue,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 36),

          // Pie de Página
          const UserProfileFooter(),
        ],
      ),
    );
  }
}