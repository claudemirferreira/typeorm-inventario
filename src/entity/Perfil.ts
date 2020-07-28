import { User } from './User';
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToMany,
  JoinColumn,
  ManyToMany,
  JoinTable,
} from "typeorm";


import { PerfilRotina } from "./PerfilRotina";

@Entity({ name: "saa_perfil" })
export class Perfil {

  @PrimaryGeneratedColumn({ name: "perf_id" })
  id: number;

  @Column({ length: 40, nullable: false })
  nome: String;

  @OneToMany(type => PerfilRotina, perfilRotina => perfilRotina.perfil)
  @JoinColumn({ name: "perf_id" })
  perfilRotinas: PerfilRotina[];
  
}
