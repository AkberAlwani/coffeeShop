package edu.mum.coffee.domain;

import javax.persistence.*;

/**
 * Created by Julia on 5/22/17.
 */
@Entity
@Table(name = "role")
public class Role {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name="role_id")
  private int id;

  @Column(name="role")
  private String role;
}
