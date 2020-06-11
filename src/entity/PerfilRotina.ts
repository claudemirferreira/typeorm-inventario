import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  JoinColumn,
  ManyToOne
} from "typeorm";
import { Perfil } from "./Perfil";
import { Rotina } from "./Rotina";

@Entity({name:"saa_perfil_rotina"})
export class PerfilRotina {

  @PrimaryGeneratedColumn({name:"perf_roti_id"})
  id: number;

  @Column({nullable:true})
  data: Date;

  @ManyToOne(type => Perfil, perfil => perfil.perfilRotinas, {primary:true})
  @JoinColumn({ name: "perf_id" })
  perfil: Perfil;

  @ManyToOne(type => Rotina, rotina => rotina.perfilRotinas, {primary:true})
  @JoinColumn({ name: "roti_id" })
  rotina: Rotina;

}
