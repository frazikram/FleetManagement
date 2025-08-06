import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Trip {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  riderId: string;

  @Column({ nullable: true })
  driverId: string;

  @Column()
  pickupLocation: string;

  @Column()
  dropOffLocation: string;

  @Column({ default: 'requested' })
  status: 'requested' | 'accepted' | 'in_progress' | 'completed' | 'cancelled';

  @Column({type:'float', nullable:true})
  fareEstimate: number;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt:Date;
}
