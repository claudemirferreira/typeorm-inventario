import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToMany,
  JoinColumn,
} from "typeorm";
import { PerfilRotina } from "./PerfilRotina";


@Entity({ name: "saa_rotina" })
export class Rotina {

  @PrimaryGeneratedColumn({ name: "roti_id" })
  id: number;

  @Column({ length: 40, nullable: false })
  nome: String;

  @Column({ length: 40, nullable: false })
  path: String;

  @Column({ length: 40, nullable: false })
  icon: String;

  @OneToMany(type => PerfilRotina, perfilRotina => perfilRotina.perfil)
  @JoinColumn({ name: "roti_id" })
  perfilRotinas: PerfilRotina[];

}
